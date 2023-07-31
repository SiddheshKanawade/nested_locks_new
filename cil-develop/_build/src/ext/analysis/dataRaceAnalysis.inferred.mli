module E = Errormsg
exception Unschedulable of string
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
  mutable elim : int;
}
val o1 : output1
type output2 = {
  mutable r1 : int;
  mutable r2 : int;
  mutable r3 : int;
  mutable r4 : int;
  mutable r5 : int;
  mutable r6 : int;
}
val o2 : output2
type output3 = {
  mutable taskName : string;
  mutable isSchedulable : string;
  mutable wcrt : float;
  mutable period : int;
}
val o3 : output3
val pa_result : (Cil.varinfo * Cil.varinfo list) list ref
val uniquelocks : string list ref
val task_response_time : blk_rt list ref
val blk_response_time : blk_rt list ref
val value : string ref
val x : int
val schedulable : int ref
val flag : int ref
val schedulabilityCheck : bool ref
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
val total_pointed_to : int ref
val display_varlist : Cil.varinfo list -> unit
val get_access : bool -> string
val display_accesspairs :
  ((Cil.fundec * (int * string * bool * 'a)) *
   (Cil.fundec * (int * string * bool * 'b)))
  list -> unit
val isin_locklist : 'a -> 'a list -> bool
val add_uniquelock : string -> unit
val check_Present : 'a list -> 'a list -> bool
val add_to_list : 'a list -> 'a -> 'a list
val getTaskLocks : task -> lock_block list -> lock_block list
val share_lock : task list -> lock_block list -> task -> bool
val share_lock_low : task list -> lock_block list -> task -> task -> bool
val rule1 : task -> task -> task list -> lock_block list -> bool
val rule2 : task -> task -> task list -> lock_block list -> bool
val isMultiple : int -> int -> bool
val low_isMultiple_of_high : int -> int -> bool
val high_isMultiple_of_low : int -> int -> bool
val sum : lock_block list -> float
val interference : float -> task list -> float
val interference2 : float -> task list -> float
val interf_by_diff : float -> float -> task list -> float
val check : lock_block -> float -> float -> task list -> float
val getPeriod : lock_block -> task list -> int
val getPriority : lock_block -> task list -> int
val isSat_eqn8 : float -> lock_block -> task list -> bool
val computeL_ilk : float -> task list -> float
val loop : float -> lock_block -> task list -> float
val worst_blk_RT : task list -> lock_block list -> 'a list
val max_list : float list -> float
val getNum : string -> task -> lock_block list -> int
val foreachlock : task -> lock_block list -> string list -> float -> float
val epsilon : float
val equalsf : float -> float -> bool
val isSat_eqn7 : float -> task -> task list -> lock_block list -> bool
val computeL_i : float -> float -> task -> task list -> float
val loop_while :
  float -> float -> task -> task list -> lock_block list -> float
val worst_task_RT : task list -> task list -> lock_block list -> 'a list
val wrt : task -> float -> blk_rt list -> float
val get_low_high : task -> task -> task * task
val rule3 : task -> task -> task list -> lock_block list -> bool
val rule4 : task -> task -> task list -> lock_block list -> bool
val gcd : int -> int -> int
val lcm : int -> int -> int
val my_min : 'a list -> 'a
val min_non_zero : task -> task -> int -> int -> int list -> int
val rule5 : task -> task -> task list -> lock_block list -> bool
val l2v : Analysis.lock -> string
val re_move : Analysis.lock list -> Analysis.lock -> Analysis.lock list
val is_in : Analysis.lock list -> Analysis.lock -> bool
val inter_section :
  Analysis.lock list -> Analysis.lock list -> Analysis.lock list
val get_lock_list :
  int -> string -> Analysis.lockT list -> Analysis.lock list
val rule6 :
  (('a * (int * string * 'b * 'c)) * ('d * (int * string * 'e * 'f))) list ->
  Analysis.lockT list ->
  (('a * (int * string * 'b * 'c)) * ('d * (int * string * 'e * 'f))) list
val getFuncs : Cil.file -> Cil.global list
val convertFuncs : Cil.global list -> Cil.fundec list
val getVars : Cil.file -> Cil.global list
val convertVars : Cil.global list -> Cil.varinfo list
val getPairs : 'a list -> ('a * 'a) list
val isin : Cil.varinfo list -> Cil.varinfo -> bool
val get_1 : 'a * 'b -> 'a
val get_2 : 'a * 'b -> 'b
val get_set_vars : Cil.varinfo -> Cil.varinfo list
val findFunVar : Cil.varinfo list -> Cil.exp -> Cil.varinfo list
val get_parameters :
  Cil.varinfo list -> Cil.exp list -> Cil.varinfo list -> Cil.varinfo list
val findExprVar : Cil.exp -> string list
val findArgVar : Cil.exp -> Cil.constant list
val getstrconst : Cil.exp -> string
val getintconst : Cil.exp -> int
val getfloatconst : Cil.exp list -> float
val findArgVars : Cil.exp list -> task
val findblockvars : Cil.exp list -> lock_block
val getBlocks : Cil.fundec list -> lock_block list list list
val getTasks : Cil.fundec list -> task list list list
val getBlockList : Cil.file -> lock_block list
val getTaskList : Cil.file -> task list
val remove : 'a list -> 'a -> 'a list
val intersection : Cil.varinfo list -> Cil.varinfo list -> Cil.varinfo list
val remove_elt : 'a -> 'a list -> 'a list
val remove_duplicates : 'a list -> 'a list
val contain :
  Cil.instr -> Cil.varinfo list -> (int * string * bool * bool) list
val findCaseVar : Cil.stmt list -> string list
val isPresent_stmt :
  Cil.stmt -> Cil.varinfo list -> (int * string * bool * bool) list list
val findstmts :
  Cil.varinfo list ->
  Cil.fundec -> (int * string * bool * bool) list list list
val getTwoListPairs : 'a list -> 'b list -> ('a * 'b) list
val samevar :
  ('a * ('b * 'c * bool * 'd)) * ('e * ('f * 'c * bool * 'g)) -> bool
val getConflictingStmts :
  (Cil.fundec * Cil.fundec) list ->
  Cil.varinfo list ->
  ((Cil.fundec * (int * string * bool * bool)) *
   (Cil.fundec * (int * string * bool * bool)))
  list
val getCAs :
  (Cil.fundec * Cil.fundec) list ->
  Cil.varinfo list ->
  ((Cil.fundec * (int * string * bool * bool)) *
   (Cil.fundec * (int * string * bool * bool)))
  list
val get_task_by_name : task -> task list -> task
val toFun :
  ('a * ('b * 'c * 'd * 'e)) * ('f * ('g * 'h * 'i * 'j)) -> 'a * 'f
val get_functions_for_task : task -> (task * 'a) list -> 'a list
val get_tasks_for_function : Cil.fundec -> ('a * Cil.fundec) list -> 'a list
val cross_product : 'a list -> 'b list -> ('a * 'b) list
val task_pairs_from_function_pair :
  Cil.fundec * Cil.fundec -> ('a * Cil.fundec) list -> ('a * 'a) list
val task_pairs_from_function_pairs :
  (Cil.fundec * Cil.fundec) list -> ('a * Cil.fundec) list -> ('a * 'a) list
val analyse :
  (task -> task -> task list -> 'a -> bool) ->
  (task * task) list -> task list -> 'a -> (task * task) list
val function_pairs_from_task_pair :
  task * task -> (task * 'a) list -> ((task * task) * ('a * 'a)) list
val function_pairs_from_task_pairs :
  (task * task) list -> (task * 'a) list -> ((task * task) * ('a * 'a)) list
val getFun : string -> Cil.fundec list -> Cil.fundec
val convertStringtoFun :
  (string * string) list -> Cil.fundec list -> (Cil.fundec * Cil.fundec) list
val presentIn :
  (Cil.fundec * ('a * 'b * 'c * 'd)) * (Cil.fundec * ('e * 'f * 'g * 'h)) ->
  (('i * 'j) * (Cil.fundec * Cil.fundec)) list -> bool
val getDetails :
  (Cil.fundec * (int * string * bool * 'a)) *
  (Cil.fundec * (int * string * bool * 'b)) ->
  ((task * task) * (Cil.fundec * Cil.fundec)) list -> unit
val getResult :
  ((task * task) * (Cil.fundec * Cil.fundec)) list ->
  ((Cil.fundec * (int * string * bool * 'a)) *
   (Cil.fundec * (int * string * bool * 'b)))
  list -> unit
val rules : (task -> task -> task list -> lock_block list -> bool) list
val rules_noRT : (task -> task -> task list -> lock_block list -> bool) list
val do_analysis :
  (task * task) list ->
  task list ->
  (task * Cil.fundec) list ->
  ((Cil.fundec * (int * string * bool * 'a)) *
   (Cil.fundec * (int * string * bool * 'b)))
  list -> Cil.file -> lock_block list -> unit
val insert_ruleValue : int -> int -> unit
val do_single_rule_analysis :
  (task * task) list ->
  task list ->
  (task * Cil.fundec) list ->
  ((Cil.fundec * (int * string * 'a * 'b)) *
   (Cil.fundec * (int * string * 'c * 'd)))
  list -> Cil.file -> lock_block list -> unit
val findFname : Cil.exp -> Cil.varinfo list
val getFname : Cil.instr -> Cil.varinfo list
val get : Cil.varinfo -> Cil.fundec list -> Cil.fundec list
val getFd : task -> Cil.fundec list -> Cil.fundec option
val getTaskFun :
  task list ->
  Cil.fundec list -> (task * Cil.fundec) list -> (task * Cil.fundec) list
val checkSchedulability : task list -> lock_block list -> unit
val maindb : Cil.file -> unit
val feature : Feature.t
