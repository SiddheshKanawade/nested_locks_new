module E = Errormsg
val onlyFunctions :
  (Cil.fundec -> Cil.location -> unit) -> Cil.global -> unit
val fnName : Cil.fundec -> Cil.location -> unit
val doit : Cil.file -> unit
val feature : Feature.t
