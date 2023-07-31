module E = Errormsg
open Cil
open Feature
open Pretty
open Printf
open List
open FNames
open Analysis
open Ptranal

exception Unschedulable of string

type blk_rt = {
  tid : string;
  lid : string;
  c : float;
  pr : int;
}

let pa_result : (varinfo * (varinfo list)) list ref = ref []

let uniquelocks = ref []

let task_response_time = ref []

let blk_response_time = ref []

let x = 1


let schedulable = ref x (* 1 = schedulable, 0 = non schedulable*)

type task = {
  tname : string;
  fname : string;
  priority : int;
  periodicity : int;
  wcet : float;
}

type lock_block = {
  line_no : int;
  task_name : string;
  lock_name : string;
  number_occur : int;
  prior : int;
  wcet : float;
  
}

let get_1 (a,_) = (*e.log "\n get first element";*) a
let get_2 (_,a) = (*e.log "\n get second element";*)a

(*******************************************Display*****************************************)

let total_pointed_to = ref 0 

(*let result_compute =*)
  let print_result (name, set) =
   let rec print_set s =
      match s with
          [] -> ()
        | h :: [] -> print_string h.vname
        | h :: t ->
	    print_string (h.vname ^ ", ");
            print_set t
    and ptsize = List.length set in
      total_pointed_to := !total_pointed_to + ptsize;
      if ptsize > 0 then
        begin
          print_string ("\n"^name.vname ^ "(" ^ (string_of_int ptsize) ^ ") -> ");
	  print_set set;
          print_newline ()
        end

let display_list1 l =
  let f elem = E.log "\t%s" elem
  in List.iter f l

let display_list l =
  let f elem = E.log "\t%s" elem.tname
  in List.iter f l

let display_cAPair_list l =
  let f elem = E.log "\n%s ->" (get_1 elem); (display_list1 (get_2 elem))
  in List.iter f l

let display_blkList l =
  let f elem = E.log "\nBlock ---------->%s , %d" elem.tid elem.pr;
	       Printf.printf "%f" elem.c
  in List.iter f l

let display_rt l =
  let f elem = E.log "\nTask ---------->%s , %d" elem.tid elem.pr;
	       Printf.printf "%f" elem.c
  in List.iter f l

let display_vlist l =
  List.iter (fun g -> 
    match g with
    | GVar (var,i, loc) -> print_endline (var.vname) 
    | _ -> failwith "no var") l

let display_varlist l =
  (*match l with
  [] -> E.log "\n Empty var list"
  | _ ->*)
  let f elem =
    	  E.log "\n Set value%s" elem.vname
  	in
          List.iter f l

let rec display_pairlist tp =
  match tp with
  | [] -> E.log ""
  | (a, b) :: rest ->
    E.log "\n\n(%s, %s) " a b;
    display_pairlist rest

let rec display_taskpair tp =
  match tp with
  | [] -> E.log "Empty task pair"
  | (a, b) :: rest -> 
    E.log "\n\n(%s, %s) " a.tname b.tname;
    display_taskpair rest

let rec display_funpair tp =
  match tp with
  | [] -> ()
  | (a, b) :: rest ->
    E.log "\n\n(%s, %s) " a.svar.vname b.svar.vname;
    display_funpair rest

let rec display_tfpairlist tf =
  match tf with
  | [] -> ()
  | (a, b) :: rest ->
    E.log "\n\n(%s, %s) " a.tname b.svar.vname;
    display_tfpairlist rest

let rec display_pairpairlist tp =
  match tp with
  | [] -> ()
  | ((a,a'), (b,b')) :: rest ->
    E.log "\n\n((%s, %s),(%s , %s)) " a.tname a'.tname b.svar.vname b'.svar.vname;
    display_pairpairlist rest

let get_access w =
  if (w=true) then "write" 
	else "read"

let rec display_accesspairs lst =
  match lst with
  | [] -> ()
  | ((a, (h,i,j,k)),(a', (h',i',j',k'))) :: rest ->
    let access = get_access j and access' = get_access j' 
	  in
    E.log "\n(<%s,%d,%s,%s>,<%s,%d,%s,%s>)" a.svar.vname h i access a'.svar.vname h' i' access';
    display_accesspairs rest

let rec display_pairs tp =
  match tp with
  | [] -> ()
  | (a, b) :: rest ->
   E.log "\n(Function pair : %s, %s); " a.svar.vname b.svar.vname;
    display_pairs rest


let displayTaskFun taskfunList =
  let lt = List.iter (fun (t,f) -> (E.log "(%s,%s)" t.tname f.svar.vname)) taskfunList
in
  lt 

let display_accesspair ap =
   match ap with
    |((a, (h,i,j,k)),(a', (h',i',j',k'))) -> 
   	  let access = get_access j and access' = get_access j' 
	  in
       E.log "\n(<%s,%d,%s,%s>,<%s,%d,%s,%s>)" a h i access a' h' i' access'
	

let rec display_fndec l =
  match l with
    [] -> print_endline "empty"
    | h :: t -> print_endline (h.svar.vname); display_fndec t

let rec display_strList l =
  match l with
    [] -> print_endline "empty"
    | h :: t -> E.log "%d" h; display_strList t

let rec display_constlist l =
  match l with
    [] -> E.log "null"
    | h :: t -> 
	begin
	  match h with
		| CInt64(i,ik,st) -> 
		  begin
			match ik with
			  | IInt -> E.log "\nIint"  ; display_constlist t
		      | _ -> E.log "Enter ikind"
		  end
		| CStr(st) -> E.log "string" 
		| _ -> E.log "Enter constant type"
	end
 


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

let add_uniquelock lock =
  if (not (isin_locklist lock !uniquelocks) )
  then
  uniquelocks := !uniquelocks @ [lock]


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

let share_lock tlist blist tk =
(*E.log "\n in share locks";*)
let low_tasks = List.filter(fun x -> x.priority < tk.priority) tlist
  in
    let tklist_locks = List.flatten(List.map (fun x -> getTaskLocks x blist) low_tasks)
    and tk_locks = getTaskLocks tk blist
    in
      check_Present tklist_locks tk_locks

let share_lock_low tlist blist tl tk =
(*E.log "\n in share locks\_lock_low";*)
let low_tasks = List.filter(fun x -> x.priority < tl.priority) tlist
  in
    let tklist_locks = List.flatten(List.map (fun x -> getTaskLocks x blist) low_tasks)
    and tk_locks = getTaskLocks tk blist
    in
      check_Present tklist_locks tk_locks
   
let rule1 (t1 : task) (t2 : task) (tasks : task list) blist  =
  (*print_endline "\nIn rule Applying rule 1 ...";
  E.log "\n Priority : %d %d" t1.priority t2.priority;*)
  if ((t1.priority = t2.priority) && 
      (not (share_lock tasks blist t1)) && 
      (not (share_lock tasks blist t2)))
  then begin (*E.log "...True";*)false end
  else begin (*E.log "...False";*)true end
  
let rule2 (t1 : task) (t2 : task) (tasks : task list) blist  =
  print_endline "\nIn Applying rule 2 ...";
  if ((t1.periodicity = t2.periodicity) && 
      (not (share_lock tasks blist t1)) && 
      (not (share_lock tasks blist t2)))
  then false
  else true

(*Check if a1 and a2 is multiple. *)
let isMultiple a1 a2 =
  if (a1 > a2) then if (a1 mod a2 = 0) then true else false
  else if (a2 mod a1 = 0) then true else false

let low_isMultiple_of_high low high =
  if(low >= high) then
    if ( low mod high = 0) then
      true
    else
      false
  else
    false

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

let rec interference2 u_ilk lt=
  match lt with
 | [] -> 0.0
 | h :: t -> 
    let curr = ((ceil (u_ilk /. float_of_int (h.periodicity) )) *. h.wcet) 
    in
    (*Printf.printf "\n Curr Val : %f" curr;*) 
    curr +. (interference2 u_ilk t)


(*Checks previously calculated response time and current response is equal *)
let rec check task prev cur lt =
  if prev = cur then prev
  else (check task cur (task.wcet +. (interference cur lt)) lt)

(*Calculates wcrt of the task*)
(*let wcrt task tasklist =
  let hp_tlist = (List.filter (fun x -> (x.priority > task.priority)) tasklist )
in
  let r0 = (task.wcet +. (sum hp_tlist)) in let r1 = (task.wcet +. (interference r0 hp_tlist)) 
in
  check task r0 r1 hp_tlist   *)
 
let getPeriod blk tlist = 
  (*try Some*)
  let tsk = (List.find(fun x -> x.tname = blk.task_name) tlist)
(*with Not_found -> None*)
 in tsk.periodicity

let getPriority blk tlist = 
  let tsk = (List.find(fun x -> x.tname = blk.task_name) tlist)
in
  tsk.priority

let isSat_eqn8 l_ilk blk tasklist = 
let high_tasks = List.filter (fun x -> (x.priority > (getPriority blk tasklist))) tasklist 
in
  (*E.log "\n Filtered list....for task ....%s\n" blk.task_name;
  display_list high_tasks;
  Printf.printf "\n blk_name : %s" blk.task_name;*)
  let new_l_ilk = blk.wcet +. (interference2 l_ilk high_tasks)
in
  if (l_ilk = new_l_ilk) then true
  else begin schedulable := 0;false end	(* Non schedulable *)

let computeL_ilk l_ilk high_tasks =
  
  (l_ilk +. (interference2 l_ilk high_tasks))
  


let rec loop l_ilk blk tasklist =
  (*Printf.printf "\nLoop - %s %d %f" blk.task_name (getPeriod blk tasklist) l_ilk;*)
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
	(*Printf.printf "\nSchedulable1 - %d, li - %f, Period - %d" !schedulable l_ilk (getPeriod blk tasklist);*)
      
      if (( !schedulable = 0) || ((l_ilk > float_of_int(getPeriod blk tasklist))))
      then
        begin
	Printf.printf "\n\nUnschedulable blk - %s" blk.task_name;
	raise ( Unschedulable "Unschedulable"  )
         end
      else
	begin
	  schedulable := 1;
	  l_ilk
	end
    end
 



let rec worst_blk_RT taskList blockList = 
  match blockList with
  [] -> (*E.log "Empty blocklist";*)[]
  | h :: t ->
     let rt = h.wcet
     in
	let l_ilk = loop rt h taskList
	in
	 blk_response_time :=  (!blk_response_time @  [{tid = h.task_name; lid = h.lock_name; c = l_ilk; pr = h.prior}] );
	 (*Printf.printf "\n Block response time%f" l_ilk;
	 Printf.printf "\n ( %s , %s , %d , %d , %f )\n" h.task_name h.lock_name h.number_occur h.prior h.wcet;*)
	 ((worst_blk_RT taskList t))

(*let element l =
match l with 
     [] -> None
    | [x] ->Some  x
    | _::t-> element t 
   
let my_max l =
match l with 
    [] -> 0.0
  | x::xs -> 
    let m = List.fold_left max xs
  in (List.head m)*)

let rec max_list l =
(*E.log "\nDEBUG max_list";*)
match l with
 [] -> 0.0
 | [h] -> h
 | h::t ->
  let maxt = max_list t in
    if h > maxt then h else maxt


(*let rec delay n lower =
match lower with
[] -> 0.0
| h::t -> (n *. (max_list lower))*)

let rec getNum lock task blkList =
(*E.log "\nDEBUG getNum - %s %s" lock task.tname;*)
  match blkList with
   [] -> 0
   | h ::t when ((h.lock_name = lock)&&(h.task_name = task.tname)) ->
      h.number_occur
   | h::t -> (getNum lock task t)


let rec foreachlock tsk blkList locklist sum =

  match locklist with
  [] -> (*Printf.printf "foreachlock sum %f" sum;*)sum
  | h :: t ->
   
    let nli = getNum h tsk blkList
    in
	(*E.log "\n foreachllllock nli val : %d" nli;*)
      let lower = List.filter (fun x -> (x.pr < tsk.priority)&&(x.lid = h)) !blk_response_time
      in
	let lower_val = List.map (fun x -> x.c) lower
	in
	  (*Printf.printf "\n max value---%d--%d--------%f" (length lower_val) (length lower_val) (max_list lower_val);*)
	  let curr = ((float_of_int nli) *. (max_list lower_val))
          in
	     (*Printf.printf "\nforeachlock - Curr - %f" curr;*)
	     foreachlock tsk blkList t (sum +. curr)
  

 

let isSat_eqn7 li tsk tasklist blkList = 
 (*E.log "\nDEBUG isSat";*)
  let lower = List.filter (fun x -> (x.pr < tsk.priority)) !blk_response_time
in
  let low_blks_rt = List.map (fun x -> x.c) !blk_response_time
in
  let higher = List.filter (fun x -> (x.priority > tsk.priority)) tasklist
in
  (*Printf.printf "\nDEBUG isSat_eqn7 %f - %f - %f" tsk.wcet (foreachlock tsk blkList !uniquelocks 0.0) (interference2 li higher);
  E.log "\n Unique locks :"; display_list1 !uniquelocks;*)
  let new_li = (tsk.wcet) +. (foreachlock tsk blkList (!uniquelocks) 0.0) +. (interference2 li higher)(*Check*)
in
  if (li = new_li) then true
  else begin schedulable := 0;false end	


let computeL_i li task taskList =
(*E.log "\nDEBUG computeL_i";*)
  let higher = List.filter (fun x -> (x.priority > task.priority)) taskList
  in
  (li +. (interference2 li higher))


let rec loop_while li tsk tasklist blkList =
  (*let lower = List.filter (fun x -> (x.pr < tsk.priority)) !blk_response_time
  and higher = List.filter (fun x -> (x.priority > tsk.priority)) tasklist
in*)
  if (not(isSat_eqn7 li tsk tasklist blkList) && (li < float_of_int(tsk.periodicity))) 
 then
  begin
  let new_li = computeL_i li tsk tasklist
  in
  schedulable := 1;
  loop_while new_li tsk tasklist blkList
  end
 else
 begin
   Printf.printf "\nSchedulable2 - %d, li - %f, Period - %d" !schedulable li tsk.periodicity ;
   if (( !schedulable = 0) || ((li > float_of_int(tsk.periodicity))))
    then
      begin
       Printf.printf "\n\nUnschedulable task - %s : Rt = %f" tsk.tname li;
       raise ( Unschedulable "Unschedulable" )
      end
   else
      begin
        schedulable := 1;
	li
      end
 end
    

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
       let new_li = loop_while li h taskList blkList
       in
	 task_response_time :=  !task_response_time @  [{tid = h.tname;lid = " "; c = new_li; pr = h.priority}] ;
	 (worst_task_RT t taskList blkList)
      
let rec wrt low_i c_i lt =
match lt with
  [] -> c_i
  | h::t when h.tid = low_i.tname -> h.c
  | h::t -> wrt low_i c_i t
   


let get_low_high t1 t2 =
  if (t1.priority > t2.priority) then
	let low = t2 and high = t1 in low,high
  else
	let low = t1 and high = t2 in low,high
  
let rule3 (t1 : task) (t2 : task) (tasks : task list) blist =
    
   Printf.printf "\nIn Applying rule 3 ...";
  
  let low, high = get_low_high t1 t2 ;
in
  if (low_isMultiple_of_high low.periodicity high.periodicity) then
     if (not ( share_lock_low tasks blist low high)) then
        if ((wrt low low.wcet !task_response_time) <= (float_of_int(high.periodicity))) then 
          false
    	else true
     else true
  else true

let rule4 (t1 : task) (t2 : task) (tasks : task list) blist =
  Printf.printf "\nIn Applying rule 4 ...";
  let low, high = get_low_high t1 t2 
in
  if (high_isMultiple_of_low high.periodicity low.periodicity) then
    if(not ( share_lock_low tasks blist low high)) then
  	false
      (*if ((wrt low low.wcet !task_response_time) <= (float_of_int(high.periodicity))) then 
    	false
    	else true*)
     else true
  else true
  
(*Gives gcd of two numbers u and v*)
let rec gcd u v =
  if v <> 0 then (gcd v (u mod v))
  else (abs u)

(*Gives lcm of m and n*) 
let lcm m n =
  match m, n with
  | 0, _ | _, 0 -> 0
  | m, n -> abs (m * n) / (gcd m n)

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
  print_endline "\nApplying rule 5 ...";
  let low,high = get_low_high t1 t2 in
    let cur = (high.periodicity mod low.periodicity) in 
      let min_val = min_non_zero high low 1 cur [] in
	if(not (isMultiple t1.periodicity t2.periodicity)) then
          if(not ( share_lock_low tasks blist low high)) then
            if ((float_of_int(min_val)) >= (wrt low low.wcet !task_response_time)) then 
	      false
	    else 
	      true
          else 
	      true
        else 
	   true

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

let rec isin_g ll a =
  match ll with
    [] -> false
    | h::t when h.vname = a -> begin  true end
    | h::t -> begin isin_g t a end

let rec issame ll a =
  match ll with
    [] -> false
    | h::t when h = a -> begin  true end
    | h::t -> begin issame t a end

let rec issame_var ll a =
  match ll with
    [] -> false
    | h::t when h.vname = a -> begin  true end
    | h::t -> begin issame_var t a end

let get_set_vars vi =
  
    let el = (List.filter (fun v -> ((get_1 v) == vi)) !pa_result)
    in
      match el with
      [] -> []
      |h::[]-> List.filter (fun v -> (v.vglob)) (get_2 h)
      

let rec findFunVar lt e =
  match e with
   | Const(c) ->(*E.log"\n Add4";*) []
   | Lval(v) -> 
      begin
        match v with
	|(lh,NoOffset) -> 
	   begin 
	     match lh with
	     Var(vi) -> 
	       if (isin lt vi) then [vi] 
	       else []
	     |Mem(Lval(Var(vi), _)) -> 
		E.log "\n11Pointer";
		get_set_vars vi
	     | _ -> E.log "\n Add new lval type";[]		
	   end
	|(lh, Field(fi, ofs))-> 
	   begin
	     match lh with
	      Var(vi) -> 
		if (isin lt vi) then [vi] 
		else []
	      |Mem(exp) -> E.log "\n12Pointer";[] 
	      | _ -> E.log "\n1 Add new lval type";[]	
	   end
	| _ ->E.log"\n Add2"; []
      end
    | BinOp(op,e1, e2,t) -> (findFunVar lt e1) @ (findFunVar lt e2)
    | UnOp(op,exp,typ) -> E.log "\n1 UnOp";[]
    | SizeOfStr(s) -> E.log "\n1 Size of str";[]
    | SizeOfE(exp) -> E.log "\n1 Size of E";[]
    | SizeOf(typ)  -> E.log "\n1 Size of type" ; []
    | AddrOf(lval) -> (*E.log "\n1 Addrof";*)[](*(get_vi lval pa_result)*)
    | StartOf(lval)-> E.log "\n1 Startof";[]
    | AlignOf(typ) -> E.log "\n1 Alignof";[]
    | AlignOfE(exp)-> E.log "\n1 AlignofE";[]
    | CastE(typ,exp)-> E.log "\n1 CastE";[]    
    | _ -> E.log "\n1 Add new expr";[]

let rec findExprVar e =
   match e with
    | Const(c) -> []
    | Lval(v) -> 
       begin match v with
	|(lh,NoOffset) -> 
	  begin
	    match lh with
	      Var(vi) -> [vi.vname] 
	      |Mem(exp) -> E.log "\n1Pointer";[] 
	  end
	| (lh, Field(fi, ofs))-> 
	  begin 
	    match lh with
	      Var(vi) -> E.log "\n Field : %s" vi.vname; [vi.vname] 
	      |	Mem(exp) -> E.log "\n 2Pointer";[] 
	  end
	|_ -> E.log"\n Add1"; []
       end
    | BinOp(op,e1, e2,t) -> (findExprVar e1) @ (findExprVar e2)
    | UnOp(op,e,t) -> (findExprVar e)
    | SizeOfStr(s) -> E.log "\nSize of str";[]
    | SizeOfE(exp) -> E.log "\n Size of E";[]
    | SizeOf(typ)  -> E.log "\n Size of type" ; []
    | AddrOf(lval) -> E.log "\n Addrof";[]
    | StartOf(lval)-> E.log "\n Startof";[]
    | AlignOf(typ) -> E.log "\n Alignof";[]
    | AlignOfE(exp)-> E.log "\n AlignofE";[]
    | CastE(typ,exp)-> (findExprVar exp)       
    | _ -> E.log "\nAdd new expr";[]

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
		|	_ -> E.log"\n Add 10"; [] 
	    end
	 | _ -> E.log"\n Add 11"; []  
       end
    | BinOp(op,e1, e2,t) -> (findArgVar e1) @ (findArgVar e2)
    | UnOp(op,e,t) -> findArgVar e
    | _ -> E.log"\n Add 12"; [] 




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
  lin::tsk::lock::numb::pr::etime ->
  (*E.log "\n Calling add_uniquelock"; *)
  add_uniquelock (getstrconst lock);
  { line_no = getintconst lin;
       task_name = getstrconst tsk;
       lock_name = getstrconst lock;
       number_occur = getintconst numb;
       prior = getintconst pr;
	wcet = getfloatconst etime;
   }
  
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
			    	  Var(vi) when vi.vname = "set_block"-> 
				       [(findblockvars el)] @ (loop1 insts);
				  | _ -> [] 
			      end
			  | _ -> []		 
  	  in 
	  loop1 ilst
	  end 
     |_ ->[]
 in 
  List.map (fun x -> (List.map (fun y -> getPars y) x.sbody.bstmts)) fd 
  
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
				|_ -> []
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
  let fd_main = List.filter(fun x -> (x.svar.vname = "main1")) fundefs 
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

(*let rec intersection_list a b =
  match a with 
    [] -> []
  | h::t when issame_var b h -> h::( intersection_list t (remove b h) )		
  | h::t -> intersection_list t b *)

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







let contain inst vlist f =
  match inst with
    Set(lv,e,loc) -> 
      begin
	match lv with
        |(lh,off1)-> 
	  begin
	    match lh with
	    Var(vi) ->  
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
   
   	   | Mem(Lval(Var(vi),_)) -> 
		E.log "\nCheck Ptr\tLOC:%d" loc.line;
		match off1 with		  
		  Field(fi,_) -> 
		    print_string ("\nCheck field"^vi.vname^"->"^fi.fname);
		    let set = get_set_vars vi
		    in
  		    List.flatten (List.map (fun x -> [(loc.line,x.vname^"->"^fi.fname,true,false)]) set) 
		  | NoOffset -> E.log "\n Nooffset";[]
		  | Index (_,_) -> E.log "\n Index";[]		  	
		
	   (*| _ -> E.log "\n Add new case";[] 	*)			
      end
      | _ -> E.log"\n Add 16"; [] 
    end
    |Call(lv,e,el,loc) -> 	
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
			 let e_uses = (findFunVar vlist e) @ 
					  List.flatten(List.map(fun x -> findFunVar vlist x) el)
			 in
			 [(loc.line,vi.vname,true,false)] @ 
				(List.map (fun x -> (loc.line,x.vname,false,true)) e_uses) 
			end
		     else 
			begin
			  let e_uses = (findFunVar vlist e)@ 
					  List.flatten(List.map(fun x -> findFunVar vlist x) el)
			  in
			  [] @ (List.map (fun x -> (loc.line,x.vname,false,true)) e_uses) 
			end
		    end
		 | Mem(exp) -> E.log "\n 4Pointer"; []
		end
		|None -> 
		  begin
			let e_uses = List.flatten(List.map(fun x -> findFunVar vlist x) el)
			in
			(*match e_uses with
			  [] -> E.log "\tEmpty e_uses";[]
			  |h::t -> *)begin 
				(*display_varlist e_uses;*)
				[] @ (List.map (fun x -> (loc.line,x.vname,false,true)) e_uses)
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
        | Case(exp,loc) -> E.log "\n\n CAse label";(findExprVar exp) @ (findCaseVar t)
	| Default(loc) -> E.log "\n\n Default label "; []
        | _ -> E.log "\n Add new label";[] 

    
let rec isPresent_stmt stmt vlist f =
  match stmt.skind with
    | Instr(ilst) -> List.map (fun x -> contain x vlist f) ilst
    | If(exp,blk1,blk2,loc) -> 
        begin
	let e_uses = findExprVar exp in
	[(List.map (fun y -> (loc.line,y,false,true)) e_uses)] @ 
        List.flatten(List.map (fun z -> (isPresent_stmt z vlist f)) blk1.bstmts)@ 
        List.flatten(List.map (fun z -> (isPresent_stmt z vlist f)) blk2.bstmts)
	end
   |  Switch(exp,blk,stmtlist,loc) -> 
	begin
        let case_uses = findCaseVar stmtlist
        and e_uses = findExprVar exp in
	let uses = case_uses @ e_uses in
	[(List.map (fun y -> (loc.line,y,false,true)) uses)] @ 
        List.flatten(List.map (fun z -> (isPresent_stmt z vlist f)) blk.bstmts)
	end
   |  Block(blk) -> E.log "\n Stmt kind is block"; []
   |  Return(exp,loc) -> (*E.log "\n Stmt kind return";*)[]
   |  Goto(stmt, loc) ->  E.log "\n Stmt kind is Goto "; []
   |  Break(loc) -> E.log "\n Stmt kind is Break "; []
   |  Continue(loc) -> E.log "\n Stmt kind is Continue "; []
   |  Loop(blk,loc,stmt1,stmt2) ->  E.log "\n Stmt kind is Loop "; []
   | _ -> E.log "\nAdd stmt kind"; []

let findstmts vlist fd f =
  (*display_stmtlist (List.filter (fun x -> isPresent x var) fn.sbody.bstmts);*)
  List.map (fun x -> (isPresent_stmt x vlist f)) fd.sbody.bstmts

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

let getConflictingStmts fplst vlst f =
  let rec loop l =
    match l with
      [] -> []
      | h :: t ->
        begin
         let f1 = (get_1 h) and f2 = (get_2 h) 
	 in
	 (*E.log "\nf1 : %s,\t f2 : %s" f1.svar.vname f2.svar.vname;*)
 	 let svars = vlst 
	 in
         let f1_stmtList = List.flatten (List.flatten (findstmts svars f1 f))
	 and f2_stmtList = List.flatten (List.flatten (findstmts svars f2 f)) 
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


let getCAs fpairlist varlist f =
  let accesslt = getConflictingStmts fpairlist varlist f in 
  accesslt

let rec get_task_by_name tk tlist = 
(*E.log "\n DEBUG get_task";*)
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

let analyse rule taskList tlist blist =
  List.filter (fun x -> rule (get_task_by_name (get_1 x) tlist) 
		             (get_task_by_name (get_2 x) tlist) tlist blist ) taskList

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
  [] -> (*E.log "DEBUG6";*)failwith "no element\n"
  | fd :: fds ->
    if (name = (fd.svar.vname)) then fd
    else getFun name fds

let convertStringtoFun ls fdList =
  List.map (fun(f1,f2) -> (getFun f1 fdList, getFun f2 fdList)) ls 

let rec presentIn accessPair taskFunPair =
 match taskFunPair with
  [] -> (*E.log "DEBUG:presentIn2";*)false
  | hd :: tl -> (*E.log "DEBUG:presentIn3";*)
     match hd with 
	((t1,t2),(f1,f2)) -> (*E.log "DEBUG:presentIn4";*)
	  match accessPair with
	     ((fn,(ln,var,w,r)),(fn',(ln',var',w',r'))) -> (*E.log "DEBUG:presentIn5";*)
	        if ((f1.svar.vname=fn.svar.vname && f2.svar.vname=fn'.svar.vname) || 
		    (f1.svar.vname=fn'.svar.vname && f2.svar.vname=fn.svar.vname))
		then 
		  begin 
		  (*E.log "\nPresent :%s %s" f1.svar.vname f2.svar.vname; *)
		  true 
		  end
		 else 
		   presentIn accessPair tl

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
  List.iter (fun x -> getDetails x tfPair) ca

let rules = [ rule1; rule2; rule3; rule4; rule5 ]

let rec do_analysis ctp tList tf ca f blklist =
  let rec loop rules con_access count =
    match rules with
      [] -> E.log "\nLocksetAnalysis";
	    let caList = rule6 con_access (Analysis.mainls f)
	    in
	    E.log "\nPotential Races: %d" (length caList);
  	    display_accesspairs caList
	    
      | hrule :: t1 -> 
	   begin
	     E.log "\nApplying rule.....%d" count;
	     let overlapTaskPair = analyse hrule ctp tList blklist
	     in
             (*E.log "\nOverlapping Task pairs";
	     display_taskpair overlapTaskPair;*)
	     let overlapTaskFunPair = function_pairs_from_task_pairs overlapTaskPair tf
	     in 
	     (*display_pairpairlist overlapTaskFunPair;*)
	     let ca_list = List.filter (fun x -> presentIn x overlapTaskFunPair ) con_access
	    in
	    match ca_list with
  	    [] -> E.log "\nPotential races : 0 "
   	    |_ -> begin
		  E.log "\nPotentially racy accesses remaining after rule%d : %d\n" count (length ca_list);
  		  (*getResult overlapTaskFunPair ca_list;*)
		  loop t1 ca_list (count+1)
		  end
          end
    in
    loop rules ca 1

let rec do_single_rule_analysis ctp tList tf ca f blist =
  E.log "\n\n\nConflicting Accesses ---->  %d" (length ca);
  let rec loop rules con_access count =
    match rules with
    [] -> E.log "\nLocksetAnalysis";
          let caList = rule6 ca (Analysis.mainls f)
	  in
	  E.log "\nNo. of CAs eliminated : %d\n" ((length ca)-(length caList));
  	  display_accesspairs caList
    | hrule :: t1 -> 
	begin
	  E.log "\nApplying rule.....%d" count;
	  let overlapTaskPair = analyse hrule ctp tList blist
	  in
          (*E.log "\nOverlapping Task pairs";
	  display_taskpair overlapTaskPair;*)
	  let overlapTaskFunPair = function_pairs_from_task_pairs overlapTaskPair tf
	  in 
	  (*display_pairpairlist overlapTaskFunPair;*)
	  let ca_list = List.filter (fun x -> presentIn x overlapTaskFunPair ) con_access
	  in
	  E.log "\nNo. of CAs eliminated : %d\n" ((length ca)-(length ca_list));
  	  (* getResult overlapTaskFunPair ca_list;*)
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

let rec getTaskFun taskList funList =
 match taskList with
 [] -> []
 | h :: t ->
   match (getFd h funList) with
     Some x -> [(h,x)] @ (getTaskFun t funList)
     | None -> [] @ (getTaskFun t funList)

(*let rec check_glob el lst result =
   match lst with
  [] -> result @ []
  | hd :: t ->
     let shared = (intersection_list (get_2 el) (lst)) in
       if (((length common) > 0)&&((get_1 el)!=(get_1 hd))) then
        result @ [(get_1 el),(get_1 hd)] @ (check_glob el t [])
     else display_list shared;[]*)
    (*result @ [(get_1 el),(get_1 hd)] @ (check_glob el t result)*)

(*let rec check_common g el lst result =
  match lst with
  [] -> result @ []
  | hd :: t ->
     let common = (intersection_list (get_2 el) (g)) in
     if (((length common) > 0)&&((get_1 el)!=(get_1 hd))&&(isin_g g (get_2 el))) then
        result @ [(get_1 el),(get_2 el)] @ (check_common g el t [])
     else result @ (check_common g el t result)

let rec check_may_alias valList gVars =
  match valList with
  [] -> []
  | h :: t ->
    (check_common gVars h valList []) @ (check_may_alias t gVars)
    (*(check_glob h gVars []) @ (check_may_alias t)*)*)


let maindb (f : file) =
  let funs = getFuncs f and vars = getVars f in

  let fundecs = convertFuncs funs and gVars = convertVars vars in
  E.log "\nShared Variables :"; 
  display_varlist gVars; 
  let fundecs_filter = List.filter(fun x -> not(x.svar.vname = "main")) fundecs in

  let funPairList = getPairs fundecs_filter 
  and taskList = getTaskList f in
 
  let blkList =  getBlockList f in

  (*worst_blk_RT taskList blkList;
  worst_task_RT taskList taskList blkList;
  display_blkList !blk_response_time;
    display_rt !task_response_time;
    display_list taskList;*)
  pa_result := !pa_result @ (Ptranal.mainpa f);
  E.log "\nPtr Analysis CIL\n";
  List.iter print_result !pa_result;

  let conflictAccessPair = (getCAs funPairList gVars f) in

  E.log "\nConflicting Accesses : %d" (length conflictAccessPair);
  display_accesspairs conflictAccessPair;
  (*let conflictFunPair = List.map(fun x -> toFun x) conflictAccessPair in 

  (*E.log "--- Conflicting Function pairs --- %d" (length conflictFunPair);*)
  (*display_funpair conflictFunPair;*)
  let taskFunctions = (getTaskFun taskList fundecs_filter) in

  (*E.log "\nTaskFunction ----- %d" (length taskFunctions);*)
  (*display_tfpairlist taskFunctions;*)
  let conflictTaskPair = task_pairs_from_function_pairs conflictFunPair taskFunctions in

  (*display_taskpair conflictTaskPair;*) 
  do_analysis conflictTaskPair taskList taskFunctions conflictAccessPair f blkList;
  E.log "\n End of do_analysis\n";
  do_single_rule_analysis conflictTaskPair taskList taskFunctions conflictAccessPair f blkList;*)
  (*pa_result = (Ptranal.mainpa f) in*)
  
  E.log "\nCompleted"
       
   
let feature  =
{ fd_name = "dis";
fd_enabled = false;
fd_description = "Race Analysis";
fd_extraopt = [];
fd_doit = maindb;
fd_post_check = true
}

let () = Feature.register feature
