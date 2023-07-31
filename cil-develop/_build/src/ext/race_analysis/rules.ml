(*#use "pairs.ml"*)
open Printf

type result =
    NonDisjoint
  | Disjoint   

let string_of_result r =
  match r with
    NonDisjoint -> "Racy"
  | Disjoint -> "Non Racy"
  

type task = {
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
  print_endline "Applying rule 1 ...";
  if (t1.priority = t2.priority) && (not (check tasks t1)) then Disjoint
  else NonDisjoint
  
(* Rule 2: Same period
If the periodicity of t1 and t2 are equal.
Then t1 and t2 do not overlap.
*)

let rule2 (t1 : task) (t2 : task) (tasks : task list) : result =
  print_endline "Applying rule 2 ...";
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
  print_endline "Applying rule 3 ...";
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
  print_endline "Applying rule 4 ...";
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
  
let rules = [ rule1; rule2; rule3]

let top_level t1 t2 tasks =
  let rec loop rules =
    match rules with
      [] -> NonDisjoint

    | hrule :: t -> let r = (hrule t1 t2 tasks) in
                      if r = NonDisjoint || r = Disjoint then r
                      else loop t
  in
  loop rules

(*Test inputs*)



let t1 = { priority = 3; periodicity = 20; wcet = 5 }
let t2 = { priority = 2; periodicity = 20; wcet = 15 }
let t3 = { priority = 3; periodicity = 20; wcet = 5 }
let t4 = { priority = 4; periodicity = 10; wcet = 5 }
let t5 = { priority = 1; periodicity = 20; wcet = 8 }
let tasks = [ t1; t2; t3; t4; t5 ]
let tasks3 = [ t1; t3; ]
(*let t6 = { priority = 1; periodicity = 8; wcet = 3 }
let t7 = { priority = 3; periodicity = 4; wcet = 2 }
let t8 = { priority = 1; periodicity = 7; wcet = 2 }
let t9 = { priority = 3; periodicity = 3; wcet = 1 }
let t10 = { priority = 1; periodicity = 8; wcet = 3 }
let t11 = { priority = 3; periodicity = 4; wcet = 2 }
let t12 = { priority = 3; periodicity = 3; wcet = 1 }
let t13 = { priority = 1; periodicity = 8; wcet = 1 }
let t14 = { priority = 3; periodicity = 4; wcet = 2 }
let t15 = { priority = 1; periodicity = 6; wcet = 1 }
let t16 = { priority = 3; periodicity = 8; wcet = 1 }
let tasks1 = [ t8; t9; ]
let tasks2 = [ t6; t7; ]

let tasks4 = [ t8; t12; ]
let tasks5 = [ t13; t14; ]
let tasks6 = [ t15; t16; ]

(*Rule level test cases*)
let rule1_t1 () =
  printf "%s" "\nSame Priority -> Non Racy\n";
  print_endline (string_of_result (rule1 t1 t3 tasks3)) (*Pr Same*)

let rule1_t2 () =
  printf "%s" "\nDifferent Priority -> Unknown\n";
  print_endline (string_of_result (rule1 t1 t2 tasks)) (*Pr different *)

let rule1_t3 () =
  printf "%s" "\nSame Priority + Higher priority tasks-> Unknown\n";
  print_endline (string_of_result (rule1 t1 t3 tasks))(*Pr different*)

let rule2_t1 () =
  printf "%s" "\nSame Period -> Non Racy\n";
  print_endline (string_of_result (rule2 t2 t5 tasks)) (*P same *)

let rule2_t2 () =
  printf "%s" "\nDifferent Period -> Unknown\n";
  print_endline (string_of_result (rule2 t4 t5 tasks))  (*P different*)

let rule2_t3 () =
  printf "%s" "\nDifferent Priority and Period -> Unknown\n";
  print_endline (string_of_result (rule2 t1 t4 tasks)) (*P and Pr different*)

let rule3_t1 () =
  printf "%s" "\nNon multiple period -> Unknown\n";
  print_endline (string_of_result (rule3 t8 t9 tasks1)) (* P different and non multiples*)

let rule3_t2 () =
  printf "%s" "\nMultiple period and RTl>Ph -> Racy\n";
  print_endline (string_of_result (rule3 t6 t7 tasks2)) (* P different and multiples*)

let rule3_t3 () =
  printf "%s" "\nMultiple period and RTl<Ph -> Non Racy\n";
  print_endline (string_of_result (rule3 t13 t14 tasks5)) (* RTl < Ph*)

let rule3_t4 () =
  printf "%s" "\nNon multiple period -> Unknown\n";
  print_endline (string_of_result (rule3 t6 t7 tasks2)) (* RTl > Ph*)

let rule3_t5 () =
  printf "%s" "\nNon multiple period -> Unknown\n";
  print_endline (string_of_result (rule3 t1 t2 tasks)) (* RTl = Ph*)

let rule4_t1() =
  printf "%s" "\nNon multiple period and min_non_zero<RTl -> Racy\n";
  print_endline (string_of_result (rule4 t8 t9 tasks1)) (* P different and non multiples*)

let rule4_t2 () =
  printf "%s" "\nNon multiple period and min_non_zero > RTl -> Non Racy\n";
  print_endline (string_of_result (rule4 t15 t16 tasks6)) (* min_non_zero >= RTl*)

let rule4_t3 () =
  printf "%s" "\nNon multiple period -> Unknown\n";
  print_endline (string_of_result (rule4 t1 t2 tasks))  (* min_non_zero < RTl*)
*)
(*Toplevel test cases*)

let toplevel_t1 () =
  printf "%s" "\nSame Priority : Rule1 -> Non Racy\n";
  print_endline (string_of_result (top_level t1 t3 tasks3)) (*Pr Same*)

(*let toplevel_t2 () =
  printf "%s" "\nDifferent Priority : Rule1 -> Unknown, Rule2 -> Non Racy\n";
  print_endline (string_of_result (top_level t1 t2 tasks)) (*Pr different *)

let toplevel_t3 () =
  printf "%s" "\nSame Period : Rule1 -> Unknown, Rule2 -> Non Racy\n";
  print_endline (string_of_result (top_level t2 t5 tasks)) (*P same *)

let toplevel_t4 () =
  printf "%s" "\nDifferent Period : Rule1 -> Unknown, Rule2 -> Unknown, Rule3 -> Racy\n";
  print_endline (string_of_result (top_level t4 t5 tasks))  (*P different*)

let toplevel_t5 () =
  printf "%s" "\nNon multiple period : Rule1 -> Unknown, Rule2 -> Unknown, Rule3 -> Unknown, Rule4 -> Racy\n";
  print_endline (string_of_result (top_level t8 t9 tasks1)) (* P different and non multiples*)

let toplevel_t6 () =
  printf "%s" "\nMultiple period and RTl > Ph : Rule1 -> Unknown, Rule2 -> Unknown, Rule3 -> Racy\n";
  print_endline (string_of_result (top_level t6 t7 tasks2)) (* P different and multiples*)

let toplevel_t7 () =
  printf "%s" "\nMultiple period and RTl < Ph : Rule1 -> Unknown, Rule2 -> Unknown, Rule3 -> Non Racy\n";
  print_endline (string_of_result (top_level t13 t14 tasks5)) (* RTl < Ph*)

let toplevel_t8 () =
  printf "%s" "\nNon multiple period and min_non_zero < RTl : Rule1 -> Unknown, Rule2 -> Unknown, Rule3 -> Unknown, Rule4 -> Racy\n";
  print_endline (string_of_result (top_level t8 t9 tasks1)) (* P different and non multiples*)

let toplevel_t9 () =
  printf "%s" "\nNon multiple period and min_non_zero > RTl : Rule1 -> Unknown, Rule2 -> Unknown, Rule3 -> Unknown, Rule4 -> Non Racy\n";
  print_endline (string_of_result (top_level t15 t16 tasks6)) (* min_non_zero >= RTl*)



let test_all () =
  rule1_t1 ();
  rule1_t2 ();
  rule2_t1 ();
  rule2_t2 ();
  rule3_t1 ();
  rule3_t2 ();
  rule3_t3 ();
  rule4_t1 ();
  rule4_t2 ();
  toplevel_t1 ();
  toplevel_t2 ();
  toplevel_t3 ();
  toplevel_t4 ();
  toplevel_t5 ();
  toplevel_t6 ();
  toplevel_t7 ();
  toplevel_t8 ();
  toplevel_t9 ()*)

let test_all () =
  toplevel_t1()

let _ = test_all ()


