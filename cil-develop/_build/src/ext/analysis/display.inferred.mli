module E = Errormsg
val display_list1 : string list -> unit
val display_list : Cil.typeinfo list -> unit
val display_blkList : New.blk_rt list -> unit
val display_rt : New.blk_rt list -> unit
val display_vlist : Cil.global list -> unit
val display_varlist : Cil.varinfo list -> unit
val display_pairs : (Cil.fundec * Cil.fundec) list -> unit
val display_pairlist : (string * string) list -> unit
val display_taskpair : (Cil.typeinfo * Cil.typeinfo) list -> unit
val display_funpair : (Cil.fundec * Cil.fundec) list -> unit
val display_tfpairlist : (Cil.typeinfo * Cil.fundec) list -> unit
val display_pairpairlist :
  ((Cil.typeinfo * Cil.typeinfo) * (Cil.fundec * Cil.fundec)) list -> unit
val get_access : bool -> string
val display_accesspairs :
  ((Cil.fundec * (int * string * bool * 'a)) *
   (Cil.fundec * (int * string * bool * 'b)))
  list -> unit
val display_accesspair :
  (string * (int * string * bool * 'a)) *
  (string * (int * string * bool * 'b)) -> unit
val display_fndec : Cil.fundec list -> unit
val display_strList : int list -> unit
val display_constlist : Cil.constant list -> unit
val displayTaskFun : (Cil.typeinfo * Cil.fundec) list -> unit
