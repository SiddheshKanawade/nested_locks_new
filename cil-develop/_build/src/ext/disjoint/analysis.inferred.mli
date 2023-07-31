module E = Errormsg
type task = {
  tname : string;
  fname : string;
  priority : int;
  period : int;
  wcet : float;
}
val display_taskList : task list -> unit
val display_taskpairList :
  ((string * string * int * int * float) *
   (string * string * int * int * float))
  list -> unit
val size : 'a list -> int
val getstrConst : Cil.exp -> string
val getintConst : Cil.exp -> int
val getfloatConst : Cil.exp list -> float
val findArgVar : Cil.exp list -> task
val getTasks : Cil.fundec list -> task list list list
val getTaskList : Cil.file -> task list
val getPairs : 'a list -> ('a * 'a) list
val getFuncs : Cil.file -> Cil.global list
val convertFuncs : Cil.global list -> Cil.fundec list
val getVars : Cil.file -> Cil.global list
val convertVars : Cil.global list -> Cil.varinfo list
val isin : 'a list -> 'a -> bool
val findFunVar : Cil.varinfo list -> Cil.exp -> Cil.varinfo list
val findExprVar : Cil.exp -> Cil.varinfo list
val contain :
  Cil.instr -> Cil.varinfo list -> (int * string * bool * bool) list
val isPresent_stmt :
  Cil.stmt -> Cil.varinfo list -> (int * string * bool * bool) list list
val findstmts :
  Cil.varinfo list ->
  Cil.fundec -> (int * string * bool * bool) list list list
val getFd : string -> Cil.fundec list -> unit
val getStmts :
  'a * string * 'b * 'c * 'd ->
  Cil.fundec list ->
  Cil.varinfo list ->
  (('a * string * 'b * 'c * 'd) * (int * string * bool * bool)) list
val getAccessList :
  ('a * string * 'b * 'c * 'd) list ->
  Cil.fundec list ->
  Cil.varinfo list ->
  (('a * string * 'b * 'c * 'd) * (int * string * bool * bool)) list
val display_AccessList :
  ((string * string * 'a * 'b * 'c) * (int * string * 'd * 'e)) list -> unit
val getConflict :
  (('a * 'b * 'c * 'd * 'e) * ('f * 'g * bool * 'h)) *
  (('a * 'i * 'j * 'k * 'l) * ('m * 'g * bool * 'n)) -> bool
val getCAPairs :
  (('a * 'b * 'c * 'd * 'e) * ('f * 'g * bool * 'h)) list ->
  ((('a * 'b * 'c * 'd * 'e) * ('f * 'g * bool * 'h)) *
   (('a * 'b * 'c * 'd * 'e) * ('f * 'g * bool * 'h)))
  list
val get_access : bool -> string
val display_CA :
  ((string * string * 'a * 'b * 'c) * (int * string * bool * 'd)) *
  ((string * string * 'e * 'f * 'g) * (int * string * bool * 'h)) -> 
  unit
val analyse : Cil.file -> unit
val mainls : Cil.file -> unit
val feature : Feature.t
