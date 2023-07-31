module E = Errormsg
open Cil
open Feature
open Pretty
open Printf

type result =
    NonDisjoint
  | Disjoint   

let string_of_result r =
  match r with
    NonDisjoint -> "Racy"
  | Disjoint -> "Non Racy"
  

type task = {
  name : string;
  priority    : int;
  periodicity : int;
  wcet	      : int;
}

(*
Rule 1: Same priority
If the priorities of t1 and t2 are equal, and there is no other task 
with priority greater than that of t1 and t2.
Then t1 and t2 do not overlap.
*)

let rec check tlist tk =
      match tlist with
        [] -> false
      | h :: t -> if (h.priority > tk.priority) then true
                  else check t tk

let rule1 (t1 : task) (t2 : task) (tasks : task list) : result =
  (*print_endline "Applying rule 1 ...";*)
  if (t1.priority = t2.priority) && (not (check tasks t1)) then Disjoint
  else NonDisjoint
  
(* Rule 2: Same period
If the periodicity of t1 and t2 are equal.
Then t1 and t2 do not overlap.
*)

let rule2 (t1 : task) (t2 : task) (tasks : task list) : result =
  (*print_endline "Applying rule 2 ...";*)
  if (t1.periodicity = t2.periodicity) then Disjoint
  else NonDisjoint

(*Check if a1 and a2 is multiple. *)
let isMultiple a1 a2 =
	if (a1 > a2) then if (a1 mod a2 = 0) then true else false
	else if (a2 mod a1 = 0) then true else false

(*Returns the sum of elements of a list*)
let rec sum lt =
  match lt with
  | [] -> 0
  | h::t -> h.wcet + (sum t)

(*Returns the sum of intereferences by higher task*)
let rec interference prev_rt lt=
	match lt with
	| [] -> 0
	| h :: t -> let curr = (int_of_float (ceil(float_of_int prev_rt /. float_of_int h.periodicity))*h.wcet) in curr + interference curr t

(*Checks previously calculated response time and current response is equal *)
let rec check task prev cur lt =
	if prev = cur then prev
	else (check task cur (task.wcet + interference cur lt) lt)

(*Calculates wcrt of the task*)
let wcrt task tasklist =
  let hp_tlist = List.filter (fun x -> (x.priority > task.priority)) tasklist in
    let r0 = (task.wcet + sum hp_tlist) in let r1 = task.wcet + interference r0 hp_tlist in
     check task r0 r1 hp_tlist    
 
(* Rule 3: Multiple period
If the periodicity of t1 and t2 are multiples and RT_L <= P_H.
Then t1 and t2 do not overlap.
*)

let get_low_high t1 t2 =
  if (t1.priority > t2.priority) then
	let low = t2 and high = t1 in low,high
  else
	let low = t1 and high = t2 in low,high
  



let rule3 (t1 : task) (t2 : task) (tasks : task list) : result =
  (*print_endline "Applying rule 3 ...";*)
  let low, high = get_low_high t1 t2 in
    if ((isMultiple low.periodicity high.periodicity) && ((wcrt low tasks) <= high.periodicity)) then
	 Disjoint 
	else NonDisjoint
  
  
  (*if (isMultiple t1.periodicity t2.periodicity) and (t1.priority > t2.priority) and (wcrt t2 tasks <= t1.periodicity) then
	 Disjoint else NonDisjoint*)


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
  let vallist = cur :: lt in
  if (k*t1.periodicity <= (lcm t1.periodicity t2.periodicity) ) then 
    let nxt = (((k+1)*t1.periodicity)mod t2.periodicity) in
      if (cur < nxt) then begin (min_non_zero t1 t2 (k+1) cur vallist) end
      else begin (min_non_zero t1 t2 (k+1+1) nxt vallist) end
  else 
	if(my_min vallist = 0) then my_min (remove vallist 0)
	else my_min vallist

(*Rule 4: Non Multiple period
If the periodicity of t1 and t2 are not multiples, 
low_val = min_non_zero(k.PH)modPL | k ∈ N and low_val >= RTL.
Then t1 and t2 do not overlap*)
let rule4 (t1 : task) (t2 : task) (tasks : task list) : result =
  (*print_endline "Applying rule 4 ...";*)
  let low,high = get_low_high t1 t2 in
    let cur = (high.periodicity mod low.periodicity) in 
      let low_val = min_non_zero high low 1 cur [] in
	if((not (isMultiple t1.periodicity t2.periodicity))&&(low_val >= wcrt low tasks)) then 
	  Disjoint 
	else 
	  NonDisjoint
  

  (*if (not (isMultiple t1.periodicity t2.periodicity)) then
    if (t1.priority > t2.priority) then 
      let cur1 = ((t1.periodicity)mod t2.periodicity) in let low_val = min_non_zero t1 t2 1 cur1 [] in
      if ((low_val >= wcrt t2 tasks)) then Disjoint 
      else Racy
      else let cur2 = ((t2.periodicity)mod t1.periodicity) in let low_val = min_non_zero t2 t1 1 cur2 [] in
	 if ((low_val >= wcrt t1 tasks)) then NonRacy 
	 else Racy
  else Unknown*)
  
let rules = [ rule1; rule2; rule3; rule4]

let top_level t1 t2 tasks =
  
  let result = List.map(fun x -> x t1 t2 tasks) rules in
   if(List.mem Disjoint result) then Disjoint
  else NonDisjoint
    

(*Test inputs*)
let t1 = { name = "ProgA"; priority = 3; periodicity = 100; wcet = 2 }
let t2 = { name = "ProgB"; priority = 2; periodicity = 200; wcet = 1 }
let t3 = { name = "h"; priority = 2; periodicity = 20; wcet = 3 }
(*let t4 = { id = l; priority = 4; periodicity = 10; wcet = 5 }
let t5 = { id = m; priority = 1; periodicity = 20; wcet = 8 }*)
let tasks1 = [ t1;t2 ]

let display_vlist l =
  List.iter (fun g -> 
    match g with
    | GVar (var,i, loc) -> print_endline (var.vname) 
    | _ -> failwith "no var") l

let display_varlist l =
  let f elem =
    	  E.log "\t%s" elem.vname
  	in
          List.iter f l

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
        (List.map (fun f -> (h, f)) t) @ (loop1 t)
    in
    loop1 lst

let rec isin ll a =
  match ll with
    [] -> false
  | h::t when h = a -> true
  | h::t -> isin t a 

let rec findFunVar lt e =
    match e with
    | Const(c) -> []
    | Lval(v) -> (match v with
		  |(lh,off) -> match lh with
			    	Var(vi) -> if (isin lt vi) then [vi] 
			      		   else [])
    | BinOp(op,e1, e2,t) -> (findFunVar lt e1) @ (findFunVar lt e2)
    | _ -> []

let rec findExprVar e =
   match e with
    | Const(c) -> []
    | Lval(v) -> (match v with
		  |(lh,off) -> match lh with
			    	Var(vi) -> [vi] 
			      |	_ -> [])
    | BinOp(op,e1, e2,t) -> (findExprVar e1) @ (findExprVar e2)
    |UnOp(op,e,t) -> findExprVar e
    | _ -> []

let rec findArgVar e =
   match e with
    | Const(c) -> [c]
    | Lval(v) -> (match v with
		  |(lh,off) -> match lh with
			    	Var(vi) -> [] 
			      |	_ -> [])
    | BinOp(op,e1, e2,t) -> (findArgVar e1) @ (findArgVar e2)
    |UnOp(op,e,t) -> findArgVar e
    | _ -> []

let rec printVar e =
    match e with
    | Const(c) -> E.log "constant"
    | Lval(v) -> (match v with
		  |(lh,off) -> match lh with
			    	Var(vi) -> E.log "\t%s" vi.vname 
			      	| _ -> print_endline ("nothing"))
    | BinOp(op,e1, e2,t) -> (printVar e1) ; (printVar e2)
	|UnOp(op,e,t) -> printVar e
    | _ -> E.log "add expr type"


let rec isint e va =
    match e with
    | Const(c) -> false
    | Lval(v) -> print_endline "\nin";(match v with
		  |(lh,off) -> match lh with
			    	Var(vi) -> if (vi=va) then true
						else false 
			      	| _ -> false)
    | BinOp(op,e1, e2,t) -> (isint e1 va) or (isint e2 va)
    | _ -> false

let get_1 (a,_) = a
let get_2 (_,a) = a


module Expr = struct
    type t = exp

    let compare (ref1 : exp) (ref2 : exp) : int =
      match ref1, ref2 with
        Lval(lv1), Lval(lv2) -> 
	  match lv1, lv2 with
	    (lh1,off1), (lh2,off2) ->
 		match lh1, lh2 with
		  Var(v1), Var(v2) -> Bytes.compare v1.vname v2.vname
      | _ -> 1

end

module ExprSet = Set.Make(Expr)

let rec display_pairs tp =
  match tp with
  | [] -> ()
  | (a, b) :: rest ->
    Printf.printf "\n(Function pair : %s, %s); " a.svar.vname b.svar.vname;
    display_pairs rest

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

(*
let getGlob stmt =
  E.log "In stmt kind";
  match stmt.skind with
	
	       |Instr(ilst) ->
		(*E.log "In instr list";*)		
		let rec loop1 ilist lt =
		  match ilist with
	     	  [] -> lt 
	     	  | inst::insts -> 
		      (*E.log "In instr kind";*)
		      match inst with
		      |Set(lv,e,loc) -> begin 
			(*E.log "In Set(lv,w ,loc)";*)
                          let e_vars = (findExprVar e) in
			     match lv with
			      |(lh,off) -> 
			          match lh with
			    	    |Var(vi) ->  (*display_varlist lt ;*)
						lt @ (vi :: e_vars) @ ( loop1 insts lt)
			      	    | _-> E.log "var else"; []
		      	      |_ -> E.log "lval else"; [] end
		      | Call(lv,e,el,loc) -> E.log "call entered";lt
		      | _ ->E.log "Else case of instr kinnnd"; []
			
		in loop1 ilst []
		| _ -> []

let getGlobVars fd  =
  E.log "\n\t%s" fd.svar.vname;
  List.flatten (List.map (fun x -> getGlob x) fd.sbody.bstmts)*)

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

let contain inst vlist =
       match inst with
         Set(lv,e,loc) -> begin
            (*let status = (isint e var) in*)
	     match lv with
             |(lh,off) -> begin
	          match lh with
	          Var(vi) ->  begin		if(isin vlist vi) then 
					begin 
					(*print_endline ("\t\t"^ vi.vname);*)
					let e_uses = (findFunVar vlist e) in
					[(loc.line,vi.vname,true,false)] @ 
					(List.map (fun x -> (loc.line,x.vname,false,true)) e_uses) 
					end
					else 
					begin
				 	let e_uses = (findFunVar vlist e) in
					[] @ (List.map (fun x -> (loc.line,x.vname,false,true)) e_uses) 
					end
			end
		    end
				
		end
	|Call(lv,e,el,loc) -> E.log "\t\t--->call entered";[]
	| _ -> E.log "Add instr kind"; []



  

let rec isPresent_stmt stmt vlist =
  match stmt.skind with
	      | Instr(ilst) -> List.map (fun x -> contain x vlist) ilst
	      | If(exp,blk1,blk2,loc) -> begin 
				let e_uses = findExprVar exp in
				[(List.map (fun y -> (loc.line,y.vname,false,true)) e_uses)] @ 		 List.flatten(List.map (fun z -> (isPresent_stmt z vlist)) blk1.bstmts)@ List.flatten(List.map (fun z -> (isPresent_stmt z vlist)) blk2.bstmts)
				end
 
		| _ -> (*E.log "\nAdd stmt kind";*) []

let findstmts vlist fd =
	(*display_stmtlist (List.filter (fun x -> isPresent x var) fn.sbody.bstmts);*)
	 List.map (fun x -> (isPresent_stmt x vlist)) fd.sbody.bstmts

  


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
    |((a, (h,i,j,k)),(a', (h',i',j',k'))) -> 
   			if ((i=i')&&(j=true||j'=true)) then true else false


let getConflictingStmts fplst vlst =
  let rec loop l =
    match l with
      [] -> []
      | h :: t ->
         begin
         let f1 = (get_1 h) and f2 = (get_2 h) in
	   print_endline ("Functions : "^f1.svar.vname ^"\t"^ f2.svar.vname);
	     (*let f1_vars = getGlobVars f1 and f2_vars = getGlobVars f2 in
               let svars = remove_duplicates (intersection f1_vars f2_vars) in*)
		let svars = vlst in

	        E.log "\nShared Variables -> ";
		display_varlist svars;

	        let f1_stmtList = List.flatten (List.flatten (findstmts svars f1))
	        and f2_stmtList = List.flatten (List.flatten (findstmts svars f2)) in

		let f1_access = List.map (fun x -> (f1.svar.vname,x)) f1_stmtList
		and f2_access = List.map (fun x -> (f2.svar.vname,x)) f2_stmtList in		

		let lst1 = getTwoListPairs f1_access f2_access in

		let lst2 = List.filter (fun x -> samevar x) lst1 in
		lst2 @ (loop t)
	
         end
  in
     loop fplst



let getCAs fpairlist varlist =
  let accesslt = getConflictingStmts fpairlist varlist in 
  accesslt
    
let rec display_accesspairs lst =
  match lst with
  | [] -> ()
  | ((a, (h,i,j,k)),(a', (h',i',j',k'))) :: rest ->
    E.log "\n(<%s,%d,%s>,<%s,%d,%s>)" a h i a' h' i';
    display_accesspairs rest



let rec get_task_by_name tname = function
      [] -> failwith ("Couldn't find task by name " ^ tname)
    | h :: t ->
        if h.name = tname then h
        else get_task_by_name tname t

let get_access b =
  if (b=true) then "write" 
	else "read" 

let display_accesspair ap =
   match ap with
    |((a, (h,i,j,k)),(a', (h',i',j',k'))) -> 
   			let access = get_access j and access' = get_access j' in
    
       E.log "\n(<%s,%d,%s,%s>,<%s,%d,%s,%s>)" a h i access a' h' i' access'
	

let applyrule accesspair =
  match accesspair with
    ((a, (h,i,j,k)),(a', (h',i',j',k'))) -> 
	  
	  let make_task_pair (a, a') =
      	    let t1 = get_task_by_name a tasks1
            and t2 = get_task_by_name a' tasks1 in (t1, t2)
    	  in
		(*E.log "Reached Apply rule"*)display_accesspair accesspair;
        	print_endline ("\t"^string_of_result (top_level t1 t2 tasks1))
        

let analyse accessPairList =
  List.iter (fun x -> applyrule x) accessPairList

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
    | h :: t -> begin
			match h with
			| CInt64(i,ik,st) -> begin
				match ik with
				  | IInt -> E.log "\nIint"  ; display_constlist t
				| _ -> E.log "Enter ikind"
					end
			| CStr(st) -> E.log "string" 
			| _ -> E.log "Enter constant type"
		end

let rec getConst l =
	
  match l with
    [] -> []
    | h :: t -> begin
			match h with
			| CInt64(i,ik,st) -> [i64_to_int i]@ (getConst t)
			| CStr(st) ->[](* [st] @ (getConst t)*)
			| _ -> []
		end

let getPars st =
  match st.skind with	
    Instr(ilst) -> begin
      let rec loop1 ilist =
	
		  match ilist with
	     	  [] -> [] 
	     	  | inst::insts -> 
       			match inst with 
         		Call(lv,e,el,loc) -> findArgVar e;(List.map(fun x -> getConst (findArgVar x)) el) @ (loop1 insts) 
			| _ -> E.log "Add ikind"; []
      
  in loop1 ilst
	end 
	|_ -> []

let getTasks fdlist = 
	
	let rec loop1 flist =
		  match flist with
	     	  [] -> [] 
	     	  | fd::fds -> 
       		List.map (fun x -> getPars x) fd.sbody.bstmts @ (loop1 fds)
      in  
		let clist = loop1 fdlist in
		display_strList (List.flatten(List.flatten(clist))); clist
	  

let mainls (f : file) =
  let funs = getFuncs f and vars = getVars f in
    let fundecs = convertFuncs funs and gVars = convertVars vars  in

      let fundecs_filter = List.filter(fun x -> not(x.svar.vname = "main")) fundecs
      and fd_main = List.filter(fun x -> (x.svar.vname = "main")) fundecs  in
	
        let funPairList = getPairs fundecs_filter and taskList = getTasks fd_main  in

	  let accessPairList = getCAs funPairList gVars in 
	     analyse accessPairList
	  (*display_accesspairs accessPairList*)        
   
let feature  =
{ fd_name = "race";
fd_enabled = false;
fd_description = "Race Analysis";
fd_extraopt = [];
fd_doit = mainls;
fd_post_check = true
}

let () = Feature.register feature
