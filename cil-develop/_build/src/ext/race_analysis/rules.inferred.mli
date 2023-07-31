type result = NonDisjoint | Disjoint
val string_of_result : result -> string
type task = { priority : int; periodicity : int; wcet : int; }
val rule1 : task -> task -> task list -> result
val rule2 : task -> task -> task list -> result
val isMultiple : int -> int -> bool
val sum : task list -> int
val interference : int -> task list -> int
val check : task -> int -> int -> task list -> int
val wcrt : task -> task list -> int
val get_low_high : task -> task -> task * task
val rule3 : task -> task -> task list -> result
val gcd : int -> int -> int
val lcm : int -> int -> int
val remove : 'a list -> 'a -> 'a list
val my_min : 'a list -> 'a
val min_non_zero : task -> task -> int -> int -> int list -> int
val rule4 : task -> task -> task list -> result
val rules : (task -> task -> task list -> result) list
val top_level : task -> task -> task list -> result
val t1 : task
val t2 : task
val t3 : task
val t4 : task
val t5 : task
val tasks : task list
val tasks3 : task list
val toplevel_t1 : unit -> unit
val test_all : unit -> unit
