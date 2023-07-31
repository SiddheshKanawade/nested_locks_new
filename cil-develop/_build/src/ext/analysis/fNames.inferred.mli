module E = Errormsg
type newT = { name : string; }
val onlyFunctions :
  (Cil.fundec -> Cil.location -> unit) -> Cil.global -> unit
val fnName : Cil.fundec -> Cil.location -> unit
val doit : Cil.file -> newT list
