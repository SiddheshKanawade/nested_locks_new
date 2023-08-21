(* 4th February 2022  *)
(* The disjoint block analysis for variable data races in periodic programs

method maindb : The starting point for disjoint block analysis
*)

module E = Errormsg
open Cil
open Feature
open Pretty
open Printf
open List
open Analysis
open Ptranal


exception Unschedulable of string

(**************************Globals*************************************)

type blk_rt = {
  tid : string;
  lid : string;
  c : float;
  pr : int;
  period : int;
}

type output1 = {
  mutable tasks : int;
  mutable conf_acc : int;
  mutable potential_races : int;
  mutable elim : int
}

let o1 = { tasks = 0; conf_acc = 0; potential_races = 0; elim = 0 }

type output2 = {
  mutable r1 : int;
  mutable r2 : int;
  mutable r3 : int;
  mutable r4 : int;
  mutable r5 : int;
  mutable r6 : int
}

let o2 = { r1 = 0; r2 = 0; r3 = 0; r4 = 0; r5 = 0; r6 = 0 }

type output3 = {
  mutable taskName : string;
  mutable isSchedulable : string;
  mutable wcrt : float;
  mutable period : int
}

let o3 = { taskName = " "; isSchedulable = " "; wcrt = 0.0; period = 0 }

let pa_result : (varinfo * (varinfo list)) list ref = ref []

let uniquelocks = ref []

(* let release_uniquelocks = ref [] *)

let task_response_time = ref []

let blk_response_time = ref []

let value = ref ""

let x = 1


let schedulable = ref x (* 1 = schedulable, 0 = non schedulable*)
let flag = ref x
let schedulabilityCheck = ref false


type task = {
  tname : string;
  fname : string;
  priority : int;
  periodicity : int;
  wcet : float;
}

type lock_block = {
  line_no : int;
  line_out : int;
  task_name : string;
  lock_name : string;
  number_occur : int;
  prior : int;
  wcet : float;
  
}

(* type release_lock_block = {
  block_type: string;  
  release_line_no : int;
  line_no : int;
  task_name : string;
  lock_name : string;
  number_occur : int;
  prior : int;
  wcet : float;
} *)

(*******************************************Display*****************************************)
let total_pointed_to = ref 0 

let display_varlist l =
  let f elem =
    	  E.log "\n%s" elem.vname
  	in
          List.iter f l

let get_access w =
  if (w=true) then "write" 
	else "read"


let rec display_accesspairs lst =
  match lst with
  | [] -> E.log "\n "; ()
  | ((a, (h,i,j,k)),(a', (h',i',j',k'))) :: rest ->
    let access = get_access j and access' = get_access j' 
	  in
    E.log "\n(<%s,%d,%s,%s>,<%s,%d,%s,%s>)" a.svar.vname h i access a'.svar.vname h' i' access';
    display_accesspairs rest


(*************************************Rules + WCRT *************************************************)

let rec isin_locklist a ll =
  match ll with
    [] -> false
    | h::t when h = a -> true
    | h::t -> isin_locklist a t 

let add_uniquelock lock =
  if (not (isin_locklist lock !uniquelocks) )
  then
  uniquelocks := !uniquelocks @ [lock]

(* let add_release_uniquelock lock =
  if (not (isin_locklist lock !release_uniquelocks) )
  then
    release_uniquelocks := !release_uniquelocks @ [lock] *)


let rec check tlist tk =
  match tlist with
  [] -> false
  | h :: t -> 
    if (h.priority > tk.priority) then true
    else check t tk


let rec check_Present tklist_lock tk_locks =
  match tk_locks with
  [] -> false
  | h::t -> 
   if(isin_locklist h tklist_lock) then begin (*E.log "\n---------Lower lock present";*) 
	true
	end
        else check_Present tklist_lock t

let add_to_list taskLocks lock =
  if (not (isin_locklist lock taskLocks))
  then
    taskLocks @ [lock]
  else 
    taskLocks

let rec getTaskLocks tk blist =
  match blist with
  [] -> []
  | h :: t when tk.tname = h.task_name -> add_to_list [] h
  | h :: t -> getTaskLocks tk t       

(*Checks a task shares lock with low priority tasks
i/p - tasklist blocklist task
o/p - true/false
*)
let share_lock tlist blist tk =

let low_tasks = List.filter(fun x -> x.priority < tk.priority) tlist
  in
    let tklist_locks = List.flatten(List.map (fun x -> getTaskLocks x blist) low_tasks)
    and tk_locks = getTaskLocks tk blist
    in
      check_Present tklist_locks tk_locks

let share_lock_low tlist blist tl tk =
let low_tasks = List.filter(fun x -> x.priority < tl.priority) tlist
  in
    let tklist_locks = List.flatten(List.map (fun x -> getTaskLocks x blist) low_tasks)
    and tk_locks = getTaskLocks tk blist
    in
      check_Present tklist_locks tk_locks

(*Rule 1 : Same priority
i/p: task1 task2 tasklist blocklist
o/p: true/false
*)
   
let rule1 (t1 : task) (t2 : task) (tasks : task list) blist  =
  if ((t1.priority = t2.priority) && 
      (not (share_lock tasks blist t1)) && 
      (not (share_lock tasks blist t2)))
  then begin false end
  else begin true end
 
(*Rule 2 : Same priority
i/p: task1 task2 tasklist blocklist
o/p: true/false
*) 
let rule2 (t1 : task) (t2 : task) (tasks : task list) blist  =
 if ((t1.periodicity = t2.periodicity) && 
      (not (share_lock tasks blist t1)) && 
      (not (share_lock tasks blist t2)))
  then false
  else begin true end

(*Check if a1 and a2 is multiple. *)
let isMultiple a1 a2 =
  if (a1 > a2) then if (a1 mod a2 = 0) then true else false
  else if (a2 mod a1 = 0) then true else false

(*Check if low is a multiple of high*)
let low_isMultiple_of_high low high =
  if(low >= high) then
    if ( low mod high = 0) then
      true
    else
      false
  else
    false

(*Check if high is a multiple of low*)
let high_isMultiple_of_low high low =
  if(high >= low) then
    if ( high mod low = 0) then
      true
    else
      false
   else
     false

(*Returns the sum of elements of a list*)
let rec sum lt =
  match lt with
  | [] -> 0.0
  | h::t -> h.wcet +. (sum t)

(*Returns the sum of intereferences by higher task*)
let rec interference prev_rt lt=
  match lt with
	| [] -> 0.0
	| h :: t -> 
     let curr = ((ceil (prev_rt /. float_of_int (h.periodicity) )) *. h.wcet) 
 in 
  curr +. (interference curr t)

(*Returns the sum of intereferences*)
let rec interference2 u_ilk lt=
  match lt with
 | [] -> 0.0
 | h :: t -> 
    let curr = ((ceil (u_ilk /. float_of_int (h.periodicity) )) *. h.wcet) 
    in
    (*Printf.printf "\n Curr Val : %f" curr;*) 
    curr +. (interference2 u_ilk t)

let rec interf_by_diff u_ilk li_prev lt=
  match lt with
 | [] -> 0.0
 | h :: t -> 
    let curr = (((ceil (u_ilk /. float_of_int (h.periodicity))) -.
                  (ceil (li_prev /. float_of_int (h.periodicity)))) *. h.wcet) 
    in
    (*Printf.printf "\n Curr Val : %f" curr;*) 
    curr +. (interf_by_diff u_ilk li_prev t)


(*Checks previously calculated response time and current response is equal *)
let rec check task prev cur lt =
  if prev = cur then prev
  else (check task cur (task.wcet +. (interference cur lt)) lt)

(*Calculates wcrt of the task (older version)*)
(*let wcrt task tasklist =
  let hp_tlist = (List.filter (fun x -> (x.priority > task.priority)) tasklist )
in
  let r0 = (task.wcet +. (sum hp_tlist)) in let r1 = (task.wcet +. (interference r0 hp_tlist)) 
in
  check task r0 r1 hp_tlist   *)
 
let getPeriod blk tlist = 
  let tsk = (List.find(fun x -> x.tname = blk.task_name) tlist)
in tsk.periodicity

let getPriority blk tlist = 
  let tsk = (List.find(fun x -> x.tname = blk.task_name) tlist)
in
  tsk.priority

(* Checking eqn8 in paper.pdf
*)
let isSat_eqn8 l_ilk blk tasklist = 
let high_tasks = List.filter (fun x -> (x.priority > (getPriority blk tasklist))) tasklist 
in  
  let new_l_ilk = blk.wcet +. (interference2 l_ilk high_tasks)
in
  if (l_ilk = new_l_ilk) then true
  else begin schedulable := 0;false end	(* Non schedulable *)

(*Compute interferences from high_tasks*)
let computeL_ilk l_ilk high_tasks =  
  (l_ilk +. (interference2 l_ilk high_tasks))

let rec loop l_ilk blk tasklist =
  if (not(isSat_eqn8 l_ilk blk tasklist) && (l_ilk < float_of_int(getPeriod blk tasklist))) 
    then
    let prio = getPriority blk tasklist 
   in
    let high_tasks = List.filter (fun x -> (x.priority > prio)) tasklist   
   in
    let new_l_ilk = computeL_ilk l_ilk high_tasks
   in
     schedulable := 1;
     loop new_l_ilk blk tasklist
   else
   begin 
     (*Printf.printf "\nSchedulable1 - %d, Task - %s, li - %f, Period - %d" !schedulable l_ilk (getPeriod blk tasklist);*)
     if (( !schedulable = 0) || ((l_ilk > float_of_int(getPeriod blk tasklist))))
     then
       begin
	Printf.printf "Unschedulable blk - %s" blk.task_name;
 	(*flag := 1;*)
	0.0
       (*raise ( Unschedulable "Unschedulable"  )*)
       end
      else
	begin
	 schedulable := 1;
	 l_ilk
	end
    end

(*Calculates wcrt of blocks
i/p: tasklist blocklist
o/p: list of wcrt of blocks*)
let rec worst_blk_RT taskList blockList = 
  match blockList with
  [] -> (*E.log "Empty blocklist";*)[]
  | h :: t ->
     let rt = h.wcet
    in
     let l_ilk = loop rt h taskList
    in
     blk_response_time :=  (!blk_response_time @  [{tid = h.task_name; lid = h.lock_name; c = l_ilk; pr = h.prior; period = 0}] );
     ((worst_blk_RT taskList t))

let rec max_list l =
match l with
 [] -> 0.0
 | [h] -> h
 | h::t ->
  let maxt = max_list t in
    if h > maxt then h else maxt

let rec getNum lock task blkList =
  match blkList with
   [] -> 0
   | h ::t when ((h.lock_name = lock)&&(h.task_name = task.tname)) ->
      h.number_occur
   | h::t -> (getNum lock task t)

let rec foreachlock tsk blkList locklist sum =
  match locklist with
  [] -> sum
  | h :: t ->   
    let nli = getNum h tsk blkList
   in
    let lower = List.filter (fun x -> (x.pr < tsk.priority)&&(x.lid = h)) !blk_response_time
   in
    let lower_val = List.map (fun x -> x.c) lower
   in
    let curr = ((float_of_int nli) *. (max_list lower_val))
   in
     foreachlock tsk blkList t (sum +. curr)
  

let epsilon = 0.001

let equalsf x y = (abs_float(x -. y) < epsilon)

let isSat_eqn7 li tsk tasklist blkList =  
  let lower = List.filter (fun x -> (x.pr < tsk.priority)) !blk_response_time
in
  let low_blks_rt = List.map (fun x -> x.c) !blk_response_time
in
  let higher = List.filter (fun x -> (x.priority > tsk.priority)) tasklist
in
  let new_li = ((tsk.wcet) +. (foreachlock tsk blkList (!uniquelocks) 0.0) +. (interference2 li higher))(*Check*)
in
  begin
  if (equalsf li new_li) then true
  else begin schedulable := 0; false end
  end	


let computeL_i li li_prev task taskList =
  let higher = List.filter (fun x -> (x.priority > task.priority)) taskList
  in
  (li +. (interf_by_diff li li_prev higher))


let rec loop_while li li_prev tsk tasklist blkList =
 
 if (not(isSat_eqn7 li tsk tasklist blkList) && (li < float_of_int(tsk.periodicity))) 
 then
  begin
  let new_li = computeL_i li li_prev tsk tasklist
  in
  schedulable := 1;
  loop_while new_li li tsk tasklist blkList
  end
 else
 begin
   
   if (( !schedulable = 0) || ((li > float_of_int(tsk.periodicity))))    
    then
      begin	
       (*Printf.printf "\nUnschedulable task - %s : Rt = %f" tsk.tname li;*)
	E.log "\nUnschedulable task - %s : WCRT = %f" tsk.tname li ;
	o3.taskName <- tsk.tname;
        o3.isSchedulable <- "Unschedulable"; 
        o3.wcrt <- li;
        o3.period <- tsk.periodicity;
	(*let out3 = open_out_gen [Open_append] 0o666 "schedulabilityResults.dat" in*)
	let out3 = open_out "schedulabilityResults.dat" in
	Printf.fprintf out3 "%s" (", " ^ o3.taskName ^ ", " ^ o3.isSchedulable ^ ", " 
^ string_of_float(o3.wcrt)^ ", " ^ string_of_int(o3.period)^ "\n");	
	close_out out3;
	flag := 1;
        0.0
       (*raise ( Unschedulable "Unschedulable" )*)
      end
   else
      begin
	E.log "\nSchedulable - %s : WCRT = %f" tsk.tname li ;
	o3.taskName <- tsk.tname;
        o3.isSchedulable <- "Schedulable"; 
        o3.wcrt <- li;
        o3.period <- tsk.periodicity;
	(*let out3 = open_out_gen [Open_append] 0o666 "schedulabilityResults.dat" in*)
	let out3 = open_out "schedulabilityResults.dat" in
       Printf.fprintf out3 "%s" (", " ^ o3.taskName ^ ", " ^ o3.isSchedulable ^ ", " 
^ string_of_float(o3.wcrt)^ ", " ^ string_of_int(o3.period)^ "\n");
	close_out out3;
        (*flag := 0;*)
        schedulable := 1;
	li
      end
     
 end
    
(*Calculate wcrt of tasks*)
let rec worst_task_RT taskList1 taskList blkList =   
   match taskList1 with
  [] -> (*E.log "Empty tasklist";*)[]
  | h :: t ->
    let lower = List.filter (fun x -> (x.pr < h.priority)) !blk_response_time
   in  
    let low_blks_rt = List.map (fun x -> x.c) !blk_response_time 
   in
    let li = h.wcet +. (foreachlock h blkList !uniquelocks 0.0)
   in
    let new_li = loop_while li 0.0 h taskList blkList
   in
    task_response_time :=  !task_response_time @  [{tid = h.tname;lid = " "; c = new_li; pr = h.priority; period = h.periodicity}] ;
    (worst_task_RT t taskList blkList)
      
let rec wrt low_i c_i lt =
match lt with
  [] -> E.log "\n\t\tEmpty";c_i
  | h::t when h.tid = low_i.tname -> h.c
  | h::t -> wrt low_i c_i t 


let get_low_high t1 t2 =
  if (t1.priority > t2.priority) then
    let low = t2 and high = t1 in low,high
  else
    let low = t1 and high = t2 in low,high
  
let rule3 (t1 : task) (t2 : task) (tasks : task list) blist =    
  (*E.log "\nIn Applying rule 3 on tasks %s %s" t1.tname t2.tname;*)
  if(!flag = 1) then
     true
  else
  begin
  let low, high = get_low_high t1 t2 ;
  in
  if (low_isMultiple_of_high low.periodicity high.periodicity) then
  begin
    if (not ( share_lock_low tasks blist low high)) then
    begin
      (*E.log "\n OUTSIDE IF  wcrt(%s)= %d ; period(%s) = %d" 
	low.tname (int_of_float(wrt low low.wcet !task_response_time))  high.tname (high.periodicity);*)
      if ((wrt low low.wcet !task_response_time) <= (float_of_int(high.periodicity))) then 
      begin
	(* E.log "\n INSIDE IF  wcrt(%s)= %d ; period(%s) = %d" 
	low.tname (int_of_float(wrt low low.wcet !task_response_time))  high.tname (high.periodicity);*)
	false
      end
    else begin  true end
   end
   else begin true end
  end
  else begin true end
  end

let rule4 (t1 : task) (t2 : task) (tasks : task list) blist =
 if(!flag = 1) then
     true
  else
  begin
  let low, high = get_low_high t1 t2 
in
  if (high_isMultiple_of_low high.periodicity low.periodicity) then
  begin
   if(not ( share_lock_low tasks blist low high)) then
	begin	
	  false
	end
     else true
  end
  else true
 end
  
(*Gives gcd of two numbers u and v*)
let rec gcd u v =
  if v <> 0 then (gcd v (u mod v))
  else (abs u)

(*Gives lcm of m and n*) 
let lcm m n =
  match m, n with
  | 0, _ | _, 0 -> 0
  | m, n -> (abs (m * n) / (gcd m n))

(*Removes element a from list ll*)
let rec remove ll a =			
  match ll with
    [] -> []
   |h::t when h = a -> t
   |h::t -> h::(remove t a)

let my_min = function
  [] -> invalid_arg "empty list"
  | x::xs -> List.fold_left min x xs

(*Returns min_non_zero*)
let rec min_non_zero t1 t2 k cur lt =
  let vallist = cur :: lt 
 in
  if (k*t1.periodicity <= (lcm t1.periodicity t2.periodicity) ) 
   then 
   let nxt = (((k+1)*t1.periodicity)mod t2.periodicity) 
  in
   if (cur < nxt) 
   then 
     begin 
       (min_non_zero t1 t2 (k+1) cur vallist) 
     end
     else 
     begin 
       (min_non_zero t1 t2 (k+1+1) nxt vallist) 
     end
    else 
      if(my_min vallist = 0) then my_min (remove vallist 0)
      else my_min vallist

(*Rule 5: Non Multiple period
If the periodicity of t1 and t2 are not multiples, 
low_val = min_non_zero(k.PH)modPL | k ∈ N and low_val >= RTL.
Then t1 and t2 do not overlap*)

let rule5 (t1 : task) (t2 : task) (tasks : task list) blist =
 if(!flag = 1) then
    true
  else
  begin
  let low,high = get_low_high t1 t2 
  in
    let cur = (high.periodicity mod low.periodicity) 
    in 
      let min_val = min_non_zero high low 1 cur [] 
      in
	if(not (isMultiple t1.periodicity t2.periodicity)) 
	then
          if(not ( share_lock_low tasks blist low high)) 
          then
	   begin
	    if ((float_of_int(min_val)) >= (wrt low low.wcet !task_response_time)) 
	    then 
	      false
	    else 
	      true
	   end
          else 
	      true
        else 
	   true
    end

let l2v (k : lock) : string =
  match k with
    Var(vi) -> vi.vname
   | _ -> "Err"

let rec re_move (ll : lock list) (a : lock) =
  match ll with
    [] -> []
   |h::t when (l2v h) = (l2v a) -> t
   |h::t                        -> h::(re_move t a)

let rec is_in (ll : lock list) (a : lock) =
  match ll with
    [] -> false
  | h::t when (l2v h) = (l2v a) -> true  (* when the underlying lock values are same *)
  | h::t -> is_in t a 

let rec inter_section a b =
  match a with 
    [] -> []
  | h::t when is_in b h -> h::( inter_section t (re_move b h) )
  | h::t -> inter_section t b 

let rec get_lock_list ln var stmtlockList = 
  match stmtlockList with
  [] -> []
  | h :: t when ln = h.line && var = h.var -> h.locklist
  | h :: t -> get_lock_list ln var t


(*type lockT = { fname : string;line : int;var : string;locklist : lock list;}*)
(*caList = ((fn:fundec,(line:int,var:string,w:bool,r:bool)),(fn',(line',var',w',r')))*)

let rec rule6 caList stmtlockList =
  match caList with
  [] -> []
  | ((f1,(line1,var1,_,_)),(f2,(line2, var2,_,_))) :: t when
    length (intersection (get_lock_list line1 var1 stmtlockList) 
                         (get_lock_list line2 var2 stmtlockList)) > 0 -> rule6 t stmtlockList
  | h :: t -> h :: (rule6 t stmtlockList)

(*******************************************************************************************)

let getFuncs (f : file)  =
  List.filter (fun g ->
    match g with
    | GFun (fd, loc) -> true 
    | _ -> false )
  f.globals  

let rec convertFuncs lst =
  match lst with
    [] -> []
    | h :: t -> 
      match h with
        GFun(fd,loc) ->  [fd] @ (convertFuncs t)
	|_ -> []

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
        GVar(vi,i, loc) ->  [vi] @ (convertVars t)
	|_ -> []

let getPairs lst =
    let rec loop1 = function
        [] -> []
      | h :: t ->
        (*[(h,h)] @*) (List.map (fun f -> (h, f)) t) @ (loop1 t)
    in
    loop1 lst

let rec isin ll a =
  match ll with
    [] -> false
    | h::t when h.vname = a.vname -> begin  true end
    | h::t -> begin isin t a end

let get_1 (a,_) = (*e.log "\n get first element";*) a
let get_2 (_,a) = (*e.log "\n get second element";*)a

let get_set_vars vi =
  
    let el = (List.filter (fun v -> ((get_1 v) == vi)) !pa_result)
    in
      match el with
      [] -> []
      |h::[]-> List.filter (fun v -> (v.vglob)) (get_2 h)
(*h::t pattern add*)


(**)
let rec findFunVar lt e =
  match e with
   | Const(c) -> []
   | Lval(v) -> 
      begin
        match v with
	|(lh,NoOffset) -> 
	   begin 
	     match lh with
	     Var(vi) -> (*E.log "\n LVAL1 :%s" vi.vname;*)
	       if (isin lt vi) then [vi] 
	       else []
	      | Mem(Lval(Var(vi), _)) -> 
		(*E.log "\nMem1111";*)
		get_set_vars vi
	     |_ -> []
	   end
	|(lh, Field(fi, ofs))-> 
	   begin
	     match lh with
	      Var(vi) -> (*E.log "\n LVAL2 :%s" vi.vname;*)
		if (isin lt vi) then [vi] 
		else []
	       | Mem(exp) ->(* E.log "\n Mem112";*)(findFunVar lt exp)
	      |_ -> []
	   end
	|(lh, Index(exp, ofs))-> 
	  begin
	    match lh with
	      Var(vi) -> (*E.log "\n LVAL3 :%s" vi.vname;*)
	       if (isin lt vi) then [vi] 
	       else []
	     | Mem(exp) -> (*E.log "\n Mem113";*)[]
	     |_ -> []	     
	  end
	| _ ->[]
      end
    | BinOp(op,e1, e2,t) -> (findFunVar lt e1) @ (findFunVar lt e2)
    | UnOp(op,e,t) -> (findFunVar lt e)
    | SizeOfStr(s) -> (*E.log "\nSize of str";*)[]
    | SizeOfE(exp) -> (*E.log "\n Size of E";*)[]
    | SizeOf(typ)  -> (*E.log "\n Size of type" ; *)[]
    | AddrOf(lval) -> (*E.log "\n Addrof";*)[]
    | StartOf(lval)-> (*E.log "\n Startof";*)[]
    | AlignOf(typ) -> (*E.log "\n Alignof";*)[]
    | AlignOfE(exp)-> (*E.log "\n AlignofE";*)[]
    | CastE(typ,exp)-> (*E.log "\n CastE"; *)[]     
    | _ -> E.log "\nAdd new to funvar";[]

let rec get_parameters lt el r =
  match el with
  [] -> r @ []
  | h::t -> r @ (findFunVar lt h) @
     (get_parameters lt t r)

let rec findExprVar e =
   match e with
    | Const(c) -> []
    | Lval(v) -> 
       begin match v with
	|(lh,NoOffset) -> 
	  begin
	    match lh with
	      Var(vi) -> [vi.vname] 
	      | Mem(exp) -> (*E.log "\n Mem7";*)[]
	      |	_ -> [] 
	  end
	| (lh, Field(fi, ofs))-> 
	  begin 
	    match lh with
	      Var(vi) ->  [vi.vname]
	      | Mem(exp) -> (findExprVar exp)
	      |	_ -> [] 
	  end
	| (lh, Index(exp, ofs))-> 
	  begin
	    match lh with
	      Var(vi) ->  [vi.vname] 
	       | Mem(exp) -> (*E.log "\n Mem9";*)[]
	      |	_ -> [] 	     
	  end
	|_ -> []
       end
    | BinOp(op,e1, e2,t) -> (findExprVar e1) @ (findExprVar e2)
    | UnOp(op,e,t) -> (findExprVar e)
    | CastE(typ,exp)-> (*E.log "\n CastE1";*) (findExprVar exp)
   
    | _ -> (*E.log "\nAdd new expr";*)[]

let rec findArgVar e =
   match e with
    | Const(c) -> [c]
    | Lval(v) -> 
       begin 
         match v with
	 |(lh,off) -> 
	    begin 
	      match lh with
		Var(vi) -> []
		| Mem(exp) -> E.log "\n Mem2";[] 
		|	_ -> [] 
	    end
	 | _ -> [] 
       end
    | BinOp(op,e1, e2,t) -> (findArgVar e1) @ (findArgVar e2)
    | UnOp(op,e,t) -> findArgVar e
    | _ -> []

let getstrconst elem =
  match elem with
  Const(c) -> 
    match c with 
   | CStr(st) -> st
   
let getintconst elem =
  match elem with
  Const(c) -> 
    match c with 
   | CInt64(i,_,_) -> (i64_to_int i)
   
let getfloatconst elem =
  match elem with
  [] -> 0.0
  | h::t ->
   match h with
    Const(c) -> 
      match c with 
     | CReal(f,fk,st) -> f

let rec findArgVars l =
  match l with
  |tn::fn::pr::p::et -> 
     {tname = getstrconst tn;fname = getstrconst fn;priority = getintconst pr; 
       periodicity = getintconst p ; wcet = getfloatconst et}

let rec findblockvars l =
match l with
| lin :: lout :: tsk :: lock :: numb :: pr :: etime->
  add_uniquelock (getstrconst lock);
  { line_no = getintconst lin;
    line_out = getintconst lout;
    task_name = getstrconst tsk;
    lock_name = getstrconst lock;
    number_occur = getintconst numb;
    prior = getintconst pr;
    wcet = getfloatconst etime;
  }
      
(*Get block details*) 
let getBlocks fd =
  let getPars st =
    match st.skind with	
    Instr(ilst) -> 
      begin
      let rec loop1 ilist =
        match ilist with
	[] -> []
	| inst::insts -> 
           match inst with 
           Call(lv,e,el,loc) -> 
	     match e with
	     Lval(v) ->  
	       match v with
	       |(lh,off) -> 
		  begin 
		  match lh with
		    Var(vi) when vi.vname = "create_block"-> 
		       [(findblockvars el)] @ (loop1 insts);
		    | _ -> [] @ (loop1 insts)
		  end
	       | _ -> []		 
  	  in 
	  loop1 ilst
	  end 
     |_ ->[]
 in 
  List.map (fun x -> (List.map (fun y -> getPars y) x.sbody.bstmts)) fd 
  
(*Get task details*)
let getTasks fd =
  let getPars st =
    match st.skind with	
      Instr(ilst) -> 
  	  begin
	  let rec loop1 ilist =
  	    match ilist with
	      [] -> []
	      | inst::insts -> 
       		 match inst with 
         	   Call(lv,e,el,loc) -> 
			match e with
			Lval(v) ->  
			  match v with
		  	    |(lh,off) ->
			      match lh with
			    	Var(vi) when vi.vname = "create_task"-> 
					[(findArgVars el)] @ (loop1 insts)
				|_ -> [] @ (loop1 insts)
  	  in 
	  loop1 ilst
	  end 
     |_ ->[]
 in 
  List.map (fun x -> (List.map (fun y -> getPars y) x.sbody.bstmts)) fd

let getBlockList f =
  let funs = getFuncs f 
  in
  let fundefs = convertFuncs funs
  in
  let fd_main = List.filter(fun x -> (x.svar.vname = "main")) fundefs 
  in
  let blocks = getBlocks fd_main
  in
  (List.flatten(List.flatten(blocks)))

  
let getTaskList f =
  let funs = getFuncs f 
  in
  let fundefs = convertFuncs funs
  in
  let fd_main = List.filter(fun x -> (x.svar.vname = "main")) fundefs 
  in
  let tasks = getTasks fd_main 
  in
  
  (List.flatten(List.flatten(tasks)))

let rec remove ll a =			
  match ll with
    [] -> []
   |h::t when h = a -> t
   |h::t -> h::(remove t a)

let rec intersection a b =
  match a with 
    [] -> []
  | h::t when isin b h -> h::( intersection t (remove b h) )		
  | h::t -> intersection t b 

let remove_elt e l =
  let rec go l acc = match l with
    | [] -> List.rev acc
    | x::xs when e = x -> go xs acc
    | x::xs -> go xs (x::acc)
  in go l []

let remove_duplicates l =
  let rec go l acc = match l with
    | [] -> List.rev acc
    | x :: xs -> go (remove_elt x xs) (x::acc)
  in go l []

(* Collecting access information of the instructions
i/p: instructions, shared variable list
o/p: 
*)
let contain inst vlist  =
  match inst with
  Set(lv,e,loc) -> 
    begin
      match lv with
      |(lh,off1)-> 
	begin
	match lh with
	Var(vi) ->  
	  begin
	  match off1 with
	    
	    NoOffset ->
	      begin 
		if(isin vlist vi) 
		  then 
		  begin 
		    let e_uses = (findFunVar vlist e) ;
		    in
		    [(loc.line,vi.vname,true,false)] @ 
		    (List.map (fun x -> (loc.line,x.vname,false,true)) e_uses) 
		  end
		else 
		  begin
		    let e_uses = (findFunVar vlist e) 
		    in
		    [] @ (List.map (fun x -> (loc.line,x.vname,false,true)) e_uses) 
		  end
      		  
	       end
	    | Field(fi,_) -> 
		begin 
		if(isin vlist vi) 
		  then 
		  begin 
		    let e_uses = (findFunVar vlist e) ;
		    in
		    [(loc.line,vi.vname^"."^fi.fname,true,false)] @ 
		    (List.map (fun x -> (loc.line,x.vname,false,true)) e_uses) 
		  end
		else 
		  begin
		    let e_uses = (findFunVar vlist e) 
		    in
		    [] @ (List.map (fun x -> (loc.line,x.vname,false,true)) e_uses) 
		  end
      		  
	       end
	    |_ -> []
	    end

       | Mem(Lval(Var(vi),_)) -> 
		begin
		match off1 with		  
		  Field(fi,_) -> 
		    let set = get_set_vars vi
		    in
		    List.flatten (List.map (fun x -> [(loc.line,x.vname^"->"^fi.fname,true,false)]) set) 
		  | NoOffset -> 
		    let set = get_set_vars vi
		    in
		    List.flatten (List.map (fun x -> [(loc.line,x.vname,true,false)]) set) 
		  | Index (_,_) -> E.log "\n Index";[]	
		end	  	
		
	| _ -> (*E.log "\n Add new case";*)[] 			
      end
   
     end
    |Call(lv,exp,expl,loc) -> 	
    begin
    match lv with
    |Some (lh,off) ->  
      begin
      match lh with
       Var(vi) ->  
       begin		
        if(isin vlist vi) 
	then 
	begin 
	 let e_uses = (findFunVar vlist exp) @ 
	     List.flatten(List.map(fun x -> findFunVar vlist x) expl)
	 in
	 [(loc.line,vi.vname,true,false)] @ 
	 (List.map (fun x -> (loc.line,x.vname,false,true)) e_uses) 
	end
	else 
	begin
	let e_uses = (findFunVar vlist exp) @ 
	    List.flatten(List.map(fun x -> findFunVar vlist x) expl)
	in
	[] @ (List.map (fun x -> (loc.line,x.vname,false,true)) e_uses) 
	end
       end
       | Mem(exp) -> E.log "\n 4Pointer"; 
	let set = get_parameters vlist expl []
	in
	display_varlist set;
  	List.flatten(List.map(fun x->[(loc.line,x.vname,true,false)])set) 
     end
    |None -> 
	begin
	let e_uses=List.flatten(List.map(fun x->findFunVar vlist x) expl)
	in
	  begin 
	    []@(List.map (fun x -> (loc.line,x.vname,false,true)) e_uses)
	  end 
	 end
          
	end
        | _ -> E.log "Add instr kind"; []

  
let rec findCaseVar stmts =
  match stmts with
  [] -> []
  | h :: t ->
    match h.labels with
      [] -> []
      | hd :: tl ->
	match hd with
        | Case(exp,loc) -> (findExprVar exp) @ (findCaseVar t)
	| Default(loc) ->  []
        | _ -> E.log "\n Add new label";[] 

    
(*Checking shared variables in the statements of the program
i/p: statement, shared variable list
o/p: list of statement containing shared variables
*)
let rec isPresent_stmt stmt vlist  =
  match stmt.skind with
    | Instr(ilst) -> List.map (fun x -> contain x vlist ) ilst
    | If(exp,blk1,blk2,loc) -> 
        begin
	let e_uses = findExprVar exp in
	[(List.map (fun y -> (loc.line,y,false,true)) e_uses)] @ 
        List.flatten(List.map (fun z -> (isPresent_stmt z vlist )) blk1.bstmts)@ 
        List.flatten(List.map (fun z -> (isPresent_stmt z vlist )) blk2.bstmts)
	end
   |  Switch(exp,blk,stmtlist,loc) -> 
	begin
        let case_uses = findCaseVar stmtlist
        and e_uses = findExprVar exp in
	let uses = case_uses @ e_uses in
	[(List.map (fun y -> (loc.line,y,false,true)) uses)] @ 
        List.flatten(List.map (fun z -> (isPresent_stmt z vlist )) blk.bstmts)
	end
   |  Block(blk) -> 
        begin
	  List.flatten(List.map (fun z -> (isPresent_stmt z vlist )) blk.bstmts)
	end
   |  Loop(blk,loc,stmt1,stmt2) ->  
	begin
	  List.flatten(List.map (fun z -> (isPresent_stmt z vlist )) blk.bstmts)
	end
   
   |  Return(exp,loc) -> (*E.log "\n Stmt kind return";*)[]
   |  Goto(stmt, loc) -> (* E.log "\n Stmt kind is Goto "; *)[]
   |  Break(loc) -> (*E.log "\n Stmt kind is Break "; *)[]
   |  Continue(loc) -> (*E.log "\n Stmt kind is Continue ";*) []
   | _ -> E.log "\nAdd stmt kind"; []

let findstmts vlist fd  =
  List.map (fun x -> (isPresent_stmt x vlist )) fd.sbody.bstmts

let getTwoListPairs lst1 lst2 =
  let rec loop1 l1 =
    match l1 with
      [] -> []
    | h :: t ->
      let rec loop2 l2 = 
	match l2 with
        [] -> []
      | h' :: t' -> (h, h') :: (loop2 t')
      in
      (loop2 lst2) @ (loop1 t)
  in
  loop1 lst1

let samevar el =
  match el with
    |((fn, (ln,var,w,r)),(fn', (ln',var',w',r'))) -> 
   			if ((var=var')&&(w=true||w'=true)) then true else false

(*Get conflicting statements of the program
i/p: functionlist, shared variable list
o/p: List of conflicting statements
*)
let getConflictingStmts fplst vlst  =
  let rec loop l =
    match l with
      [] -> []
      | h :: t ->
        begin
         let f1 = (get_1 h) and f2 = (get_2 h) 
	 in
	 let svars = vlst 
	 in
         let f1_stmtList = List.flatten (List.flatten (findstmts svars f1))
	 and f2_stmtList = List.flatten (List.flatten (findstmts svars f2 )) 
	 in
 	 let f1_access = List.map (fun x -> (f1,x)) f1_stmtList
	 and f2_access = List.map (fun x -> (f2,x)) f2_stmtList 
	 in		
	 let lst1 = getTwoListPairs f1_access f2_access 
	 in
	 let lst2 = List.filter (fun x -> samevar x) lst1 
	 in
	  lst2 @ (loop t)
	end
   in
   loop fplst

let getCAs fpairlist varlist =
  let accesslt = getConflictingStmts fpairlist varlist in 
  accesslt

let rec get_task_by_name tk tlist = 
match tlist with
     [] -> failwith ("Couldn't find task by name " ^ tk.tname)
    | h :: t -> 
        if h.tname = tk.tname then h
        else get_task_by_name tk t

let toFun ap =
   match ap with
    |((fn, (ln,var,w,r)),(fn', (ln',var',w',r'))) -> (fn,fn')

let get_functions_for_task task taskfunList =
    let tfs = List.filter (fun (t, f) -> (t.tname = task.tname)) taskfunList in
    List.map (fun (t, f) -> f) tfs 

let get_tasks_for_function f taskfunctions =
  let tfs = List.filter (fun (t', f') -> f'.svar.vname = f.svar.vname) taskfunctions in
  List.map (fun (t, f) -> t) tfs

let cross_product l1 l2 =
  let f e l = List.map (fun e' -> e', e) l in
  let lol = List.map (fun e -> (f e l1)) l2 in
  List.fold_right (fun x y -> x @ y) lol []

let task_pairs_from_function_pair (f1, f2) taskfunctions =
  let f1_tasks = get_tasks_for_function f1 taskfunctions
  and f2_tasks = get_tasks_for_function f2 taskfunctions in
  cross_product f1_tasks f2_tasks

let task_pairs_from_function_pairs fpairs taskfunctions =
  let lol = List.map (
              fun fp -> task_pairs_from_function_pair fp taskfunctions
           ) fpairs in
  let dup_pairs = List.fold_right (fun x y -> x @ y) lol [] in
  let pair_eq (f1, s1) (f2, s2) =
    ((f1 = f2) && (s1 = s2)) || ((f1 = s2) && (s1 = f2))
  in
  
    let rec mymem x = function
        [] -> false
      | h :: t -> if pair_eq h x then true else mymem x t
    in
    
    let filter_tasks pair_lst =
      let rec loop lst acc =
        match lst with
          [] -> acc
        | (f, s) :: t -> if (mymem (f, s) acc) || f = s then (loop t acc)
                    else loop t ((f, s) :: acc)
      in
      loop pair_lst []
    in
    filter_tasks dup_pairs

(*Rule analysis
i/p: rule, tasklist, tasklist, blocklist
o/p: list of task*)
let analyse rule taskList tlist blist =
  List.filter (fun x -> rule (get_task_by_name (get_1 x) tlist) 
		             (get_task_by_name (get_2 x) tlist) tlist blist ) taskList

(*Get function pairs from task pairs
i/p: task pair, task function map
o/p: function pair*)
let function_pairs_from_task_pair (t1, t2) taskfunctions =
    let t1_funs = get_functions_for_task t1 taskfunctions
    and t2_funs = get_functions_for_task t2 taskfunctions in
    let fps = cross_product t1_funs t2_funs in
    List.map (fun fp -> ((t1, t2), fp)) fps
    
let function_pairs_from_task_pairs tpList taskFunList =
  let lol = 
    List.map (fun fp -> function_pairs_from_task_pair fp taskFunList) tpList 
    in
    let dup_pairs = List.fold_right (fun x y -> x @ y) lol []
    in 
    dup_pairs

let rec getFun name flist =
  match flist with
  [] -> failwith "no element\n"
  | fd :: fds ->
    if (name = (fd.svar.vname)) then fd
    else getFun name fds

let convertStringtoFun ls fdList =
  List.map (fun(f1,f2) -> (getFun f1 fdList, getFun f2 fdList)) ls 

let rec presentIn accessPair taskFunPair =
 match taskFunPair with
  [] -> false
  | hd :: tl -> 
     match hd with 
	((t1,t2),(f1,f2)) -> 
	  match accessPair with
	     ((fn,(ln,var,w,r)),(fn',(ln',var',w',r'))) -> 
	        if ((f1.svar.vname=fn.svar.vname && f2.svar.vname=fn'.svar.vname) || 
		    (f1.svar.vname=fn'.svar.vname && f2.svar.vname=fn.svar.vname))
		then 
		  begin 
		    true 
		  end
		 else 
		   presentIn accessPair tl

(*Get conflicting access details
i/p: conflicting access, task function pair list
o/p: conflicting access pair
*)
let rec getDetails ca tfPair =
  match tfPair with
  [] -> E.log "Empty list..."
  | hd :: tl -> 
    match hd with
    ((t1,t2),(f1,f2)) -> 
       match ca with
         ((fn,(ln,var,w,r)),(fn',(ln',var',w',r'))) -> 
	    if ((f1.svar.vname=fn.svar.vname && f2.svar.vname=fn'.svar.vname) || 
		(f1.svar.vname=fn'.svar.vname && f2.svar.vname=fn.svar.vname))
	     then 
             begin
              let access = get_access w and access' = get_access w' 
              in 
              E.log "\n< %s,%s,%d,%s,%s > , <%s,%s,%d,%s,%s>" 
                       t1.tname f1.svar.vname ln var access t2.tname f2.svar.vname ln' var' access'; 
	     end
	    else
	     getDetails ca tl 

let getResult tfPair ca = 
  E.log "\n \n Potentially racy accesses:";
  List.iter (fun x -> getDetails x tfPair) ca

let rules = [ rule1; rule2; rule3; rule4; rule5 ]

let rules_noRT = [ rule1; rule2 ]

(* Analysis is performed using all six rules and detects final list of potentially racy accesses
i/p - conflicting task pairs, task list, task function list, conflicting accesses, input file, block list
o/p - detects potentially racy data accesses 
*)
let rec do_analysis ctp tList tf ca f blklist =
  let rec loop rules con_access count =
    match rules with
      [] -> E.log "\nApplying rule6.";
	    let caList = rule6 con_access (Analysis.mainls f)
	    in
	    E.log "\nPotential Races: %d" (length caList);
	     o1.potential_races <- (length caList);
  	    display_accesspairs caList
	    
      | hrule :: t1 -> 
	   begin
	     let overlapTaskPair = analyse hrule ctp tList blklist
	     in
             let overlapTaskFunPair = function_pairs_from_task_pairs overlapTaskPair tf
	     in 
	     let ca_list = List.filter (fun x -> presentIn x overlapTaskFunPair ) con_access
	    in
	    match ca_list with
  	    [] -> E.log "\nPotential races: 0 "; o1.potential_races <- 0;
   	    |_ -> begin
		  E.log "\nPotentially racy accesses remaining after rule%d : %d\n" count (length ca_list);
  		  loop t1 ca_list (count+1)
		  end
          end
    in
    loop rules ca 1


(* Output values for rule1, rule2, rule3, rule4, rule5
*)
let insert_ruleValue rule value =
  if(rule == 1) then o2.r1 <- value
  else if(rule == 2) then o2.r2 <- value
  else if(rule == 3) then o2.r3 <- value
  else if(rule == 4) then o2.r4 <- value
  else o2.r5 <- value
(* Applies each rule individually
i/p - conflicting task pairs, task list, task function list, conflicting accesses, input file, block list
o/p - detects potentially racy data accesses detected by single rule
*)
let rec do_single_rule_analysis ctp tList tf ca f blist =
  E.log "\nConflicting Accesses : %d" (length ca);
  let rec loop rules con_access count =
    match rules with
    [] -> E.log "\nApplying rule.....6";
          let caList = rule6 ca (Analysis.mainls f)
	  in
	  E.log "\nNo. of CAs eliminated: (%d-%d) = %d\n" (length ca) (length caList) ((length ca)-(length caList));
	   o2.r6 <- ((length ca)-(length caList))
  	  
    | hrule :: t1 -> 
	begin
	  E.log "\nApplying rule.....%d" count;
	  let overlapTaskPair = analyse hrule ctp tList blist
	  in
          
	  let overlapTaskFunPair = function_pairs_from_task_pairs overlapTaskPair tf
	  in 
	  
	  let ca_list = List.filter (fun x -> presentIn x overlapTaskFunPair ) con_access
	  in
	   E.log "\nNo. of CAs eliminated: (%d-%d) = %d\n" (length ca) (length ca_list) ((length ca)-(length ca_list));
  	   insert_ruleValue count ((length ca)-(length ca_list));
	  loop t1 ca (count+1)
	end
  in
    loop rules ca 1

let findFname exp =
  match exp with
  Lval(v) -> 
    match v with
      (lh,off) -> 
	match lh with
	  Var(vi) -> [vi]
  | _ -> []

let getFname inst =
  match inst with
  Call(lv,e,el,loc) -> findFname e
  | _ -> []

let get var fnList =
  let match_var_fun var fn =
    if (fn.svar.vname = var.vname) then [fn]
    else []
  in
    (List.flatten(List.map (fun x -> match_var_fun var x) fnList))

let getFd tk flist =
  try Some
  (List.find(fun x -> x.svar.vname = tk.fname) flist)
  with Not_found -> None

let rec getTaskFun taskList funList result =
 match taskList with
 [] -> result @ []
 | h :: t ->
   match (getFd h funList) with
     Some x ->  [(h,x)] @ result @ (getTaskFun t funList result)
     | None -> result @ (getTaskFun t funList result)



let checkSchedulability taskList blkList =
  worst_blk_RT taskList blkList;
  worst_task_RT taskList taskList blkList;
 
  E.log "\n\n...Schedulability Analysis Completed..."


let maindb (f : file) =

  let out1 = open_out "results.dat" and out2 = open_out "ruleCoverage.dat" in
  
  let funs = getFuncs f and vars = getVars f in

  let fundecs = convertFuncs funs and gVars = convertVars vars in
 
  let fundecs_filter = List.filter(fun x -> not(x.svar.vname = "main")) fundecs in

  let funPairList = getPairs fundecs_filter 
  and taskList = getTaskList f in
 
  let blkList =  getBlockList f in
  E.log "\nResults";
  E.log "\nThis is temp";
  E.log "\nNo. of tasks: %d" (length taskList);
  o1.tasks <- length taskList;
  flag := 0;

  if !schedulabilityCheck then
  begin
    checkSchedulability taskList blkList;
  end
  else
  begin
     worst_blk_RT taskList blkList;
     worst_task_RT taskList taskList blkList;    
  
  pa_result := !pa_result @ (Ptranal.mainpa f);
 
  let conflictAccessPair = getCAs funPairList gVars in

 E.log "\nConflicting Accesses: %d" (length conflictAccessPair);
  o1.conf_acc <- (length conflictAccessPair);
  display_accesspairs conflictAccessPair;
  let conflictFunPair = List.map(fun x -> toFun x) conflictAccessPair in 

  let taskFunctions = (getTaskFun taskList fundecs_filter []) in

  let conflictTaskPair = task_pairs_from_function_pairs conflictFunPair taskFunctions in
   
  do_analysis conflictTaskPair taskList taskFunctions conflictAccessPair f blkList;
 
  E.log "\n\nRule Coverage\n";
  do_single_rule_analysis conflictTaskPair taskList taskFunctions conflictAccessPair f blkList;

  let percent_elim = (int_of_float(((float_of_int(o1.conf_acc - o1.potential_races) /. float_of_int(o1.conf_acc)) *. 100.0))) in
  o1.elim <- percent_elim;
  
  Printf.fprintf out1 "%s" (", " ^ string_of_int(o1.tasks) ^ ", " ^ string_of_int(o1.conf_acc) ^ ", " ^ string_of_int(o1.potential_races) ^ ", " ^ string_of_int(o1.elim) ^ "\n");

  Printf.fprintf out2 "%s" (", " ^ string_of_int(o1.conf_acc) ^ ", " ^ string_of_int(o2.r1) ^ ", " ^ string_of_int(o2.r2)^ ", " ^ string_of_int(o2.r3)^ ", " ^ string_of_int(o2.r4)^ ", " ^ string_of_int(o2.r5)^ ", " ^ string_of_int(o2.r6) ^ "\n");
  
  close_out out1;
  close_out out2;
   E.log "\n\n...Analysis Completed..."
  end
       
   
let feature  =
{ fd_name = "disjoint";
fd_enabled = false;
fd_description = "Race Analysis for periodic programs";
fd_extraopt = [
("--schedulabilityCheck",Arg.Unit (fun _ -> schedulabilityCheck := true)
, " print schedulability of tasks in a periodic program")
];
fd_doit = maindb;
fd_post_check = true
}

let () = Feature.register feature
