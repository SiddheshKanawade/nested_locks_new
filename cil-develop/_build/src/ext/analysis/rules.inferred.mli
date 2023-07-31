module E = Errormsg
type lock_block = {
  line_no : int;
  task_name : string;
  lock_name : string;
  block_id : int;
  number_occur : int;
}
val get_access : bool -> string
val display_accesspairs :
  ((Cil.fundec * (int * string * bool * 'a)) *
   (Cil.fundec * (int * string * bool * 'b)))
  list -> unit
