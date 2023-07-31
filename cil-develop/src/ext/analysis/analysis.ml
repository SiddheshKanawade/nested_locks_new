
(* The lockset analysis for variable data races with a lock taken for one kind of block. *)

open Cil 
open Feature
open Pretty
open Printf
(* open Tututil *)

module L  = List     
module E  = Errormsg 
module IH = Inthash  (* A hash table specialized on integer keys *)
module DF = Dataflow 

(* ********************************************** *)
(* Utility functions *)
let debug = ref false

type funT = { mutable funName : string }
let currFun =  { funName  = "Dummy"}



let (|>) (a : 'a) (f : 'a -> 'b) : 'b = f a

let gVar = ref []



let onlyFunctions (fn : fundec -> location -> unit) (g : global) : unit = 
  match g with
  | GFun(f, loc) -> fn f loc
  | _ -> ()

let getVars (f : file)  =
  List.filter (fun g ->
    match g with
    | GVar(vi,i, loc) -> true 
    | _ -> false )
  f.globals

let rec convertVars lst =
  match lst with
    [] -> []
    | h :: t -> 
      match h with
        GVar(vi,i, loc) -> gVar :=  !gVar @  [vi] @ (convertVars t); []
	|_ -> []

let rec presentIn lst var =
  match lst with
  [] -> false
  | h :: t when h.vname = var.vname -> true
  | h :: t -> presentIn t var



(* ********************************************** *)


(* ********************************************** *)
(* Dataflow value *)

type lock = lhost 

type lockT = {
  funame : string;
  line : int;
  var : string;
  locklist : lock list;
}

let lock_set = ref []

let l2v (k : lock) : string =
  match k with
    Var(vi) -> vi.vname
   | _ -> "Err"

let l2v_list (ll : lock list) : string =
  ll |> L.map l2v |> String.concat ""

let lock_list_pretty () (ll : lock list) =
  ll |> l2v_list |> text

let rec remove (ll : lock list) (a : lock) =
  match ll with
    [] -> []
   |h::t when (l2v h) = (l2v a) -> t
   |h::t                        -> h::(remove t a)

let rec isin (ll : lock list) (a : lock) =
  match ll with
    [] -> false
  | h::t when (l2v h) = (l2v a) -> true  (* when the underlying lock values are same *)
  | h::t -> isin t a 

let rec intersection a b =
  (*E.log "\n Intersection in A";*)
  match a with 
    [] -> []
  | h::t when isin b h -> h::( intersection t (remove b h) )
  | h::t -> intersection t b 

let lock_list_add (ll:lock list) (a:lock) =
   a::ll

let rec lock_list_add_all ll args =
  match args with
   []         ->  ll
  | Lval((Var(i),_))::t -> lock_list_add_all (lock_list_add ll (Var(i))) t
  | _         -> E.log "Expect locks to be simple variables.."; ll

let rec lock_list_remove ll a =
  match ll with
    [] -> []
  | h::t when (l2v h) = (l2v a) -> t
  | h::t -> h::(lock_list_remove t a) 

let rec lock_list_remove_all ll args =
  match args with
    [] -> ll
  | Lval((Var(i),_))::t -> lock_list_remove_all ( lock_list_remove ll (Var(i)) ) t
  | _ -> ll

let lock_list_handle_inst (i : instr) (ll : lock list) : lock list =
  match i with  
   Call(dest, what, args, l) -> 
     (match what with
       Lval((Var(vi), _ )) when vi.vname = "GetResource" -> lock_list_add_all ll args 
      |Lval((Var(vi), _ )) when vi.vname = "ReleaseResource" -> lock_list_remove_all ll args
      | _ -> ll  (* any other function call *)
     ) (* end of inner match *)

   | _ -> ll (* any other instruction *)


(* ********************************************** *)


(* ********************************************** *)
(* Dataflow Analysis *)

module LockSetDF = struct
(* 
  LockSetDF implements the ForwardsTransfer signature declared in dataflow.ml 
  ForwardsTransfer describes elements of a forward flow analysis. 
*)

  let name = "LockSet"
  let debug = debug
  type t = lock list  (* type of Data flow value *)
  let copy ll = ll
(* contain a mapping from statement IDs to 'lock sets' *)
  let stmtStartData = IH.create 64
  let pretty = lock_list_pretty
  let computeFirstPredecessor stm ll = ll

(* combinePredecessors defines join operation. *)
  let combinePredecessors (s : stmt) ~(old : t) (ll : t) =
    if old = ll then None else
    Some(intersection old ll)

(* doInstr defines transfer function for an instruction. *)
  let doInstr (i : instr) (ll : t) =
    let action = lock_list_handle_inst i in    
    DF.Post action

  let doStmt stm ll = DF.SDefault 
(*  
  The default action is to do the instructions in this statement, if applicable,
  and continue with the successors.
*)

  let doGuard c ll = DF.GDefault
  let filterStmt stm = true
(*
  Whether to put this statement in the worklist. This is called when a block 
  would normally be put in the worklist.
*)

end (* module LockSetDF *)

(* ********************************************** *)

module LockSet = DF.ForwardsDataFlow(LockSetDF)


(* ********************************************** *)
(* The Algorithm *)

let computeLockSet (fd : fundec) : unit =
  Cfg.clearCFGinfo fd;
  ignore(Cfg.cfgFun fd);
  let first_stmt = L.hd fd.sbody.bstmts in
  let ll = [] in
  IH.clear LockSetDF.stmtStartData;
  IH.add LockSetDF.stmtStartData first_stmt.sid ll;
  LockSet.compute [first_stmt]

(* ********************************************** *)


(* ********************************************** *)
(* Printing result *)

let getLockSet (sid : int) : lock list option =
  try Some(IH.find LockSetDF.stmtStartData sid)
  with Not_found -> None


let instrLockSet (il : instr list) (ll : lock list) : lock list list =
  let proc_one hil i =
    match hil with
    | [] -> (lock_list_handle_inst i ll) :: hil
    | ll':: rest as l -> (lock_list_handle_inst i ll') :: l
  in
  il |> L.fold_left proc_one [ll] |> L.tl |> L.rev 

class llVisitorClass = object(self)
  inherit nopCilVisitor

  val mutable sid           = -1
  val mutable state_list    = []
  val mutable current_state = None

(* Invoked on Control-flow statement. *)
  method vstmt stm =
    sid <- stm.sid;
    begin match getLockSet sid with
    | None -> current_state <- None
    | Some ll -> begin
      match stm.skind with
      | Instr il ->
        current_state <- None;
        state_list <- instrLockSet il ll 
      | _ -> current_state <- None
    end end;
    DoChildren

(* Invoked on each instruction occurrence. *)
  method vinst i =
    try let data = L.hd state_list in
        current_state <- Some(data);
        state_list <- L.tl state_list;
        DoChildren
    with Failure "L.hd state_list" -> DoChildren

  method get_cur_ll () =
    match current_state with
    | None -> getLockSet sid
    | Some ll -> Some ll

end  (* end class llVisitorClass *)

class varUseReporterClass = object(self)
  inherit llVisitorClass as super

(* vlval - Invoked on each lvalue occurrence. *)			

  method vlval (vl : lval) =
    match self#get_cur_ll () with
    | None -> SkipChildren
    | Some ll ->  
	begin		
         (*E.log "\nLocklist : %a" lock_list_pretty ll;*)
         match vl with
          (Var(vi), NoOffset) when presentIn !gVar vi -> 
          lock_set := !lock_set @ [{funame = currFun.funName; line = !currentLoc.line; var = vi.vname; locklist = ll  }](*;
          E.log "\n%a%a;%s;%a" d_loc (!currentLoc) d_lval vl currFun.funName lock_list_pretty ll*)

         |(Var(vi), Index(_, _)) when presentIn !gVar vi -> 
         lock_set := !lock_set @ [{funame = currFun.funName; line = !currentLoc.line; var = vi.vname; locklist = ll   }](*;
          E.log "\n%a%a;%s;%a" d_loc (!currentLoc) d_lval vl currFun.funName lock_list_pretty ll*)
	 
	 |(Var(vi), Field(fi, ofs)) when presentIn !gVar vi -> 
         lock_set := !lock_set @ [{funame = currFun.funName; line = !currentLoc.line; var = vi.vname; locklist = ll   }](*;
          E.log "\n%a%a;%s;%a" d_loc (!currentLoc) d_lval vl currFun.funName lock_list_pretty ll*)

         | _ -> E.log "" 
        end;
	
	SkipChildren


end (* class varUseReporterClass *)


let lockSetAnalysis (fd : fundec) (loc : location) : unit =
 currFun.funName <- fd.svar.vname;
 computeLockSet fd;
(* E.log "\n%s" fd.svar.vname ;*)
 let vis = ((new varUseReporterClass) :> nopCilVisitor) in                                  
 ignore(visitCilFunction vis fd);
 Cfg.clearCFGinfo fd 


let mainls (f : file) : lockT list =
 uniqueVarNames f;
 let sharedVars = getVars f 
in
 convertVars sharedVars;

 Cfg.computeFileCFG f;
 iterGlobals f (onlyFunctions lockSetAnalysis);
 !lock_set 

(*
let feature  =
{ fd_name = "lockset";
fd_enabled = false;
fd_description = "Lock Set Analysis for PP programs";
fd_extraopt = [];
fd_doit = mainls;
fd_post_check = true
}

let () = Feature.register feature*)
(* ********************************************** *)

