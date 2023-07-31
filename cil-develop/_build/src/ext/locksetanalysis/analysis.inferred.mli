module L = List
module E = Errormsg
module IH = Inthash
module DF = Dataflow
val debug : bool ref
type funT = { mutable funName : string; }
val currFun : funT
val ( |> ) : 'a -> ('a -> 'b) -> 'b
val gVar : Cil.varinfo list ref
val onlyFunctions :
  (Cil.fundec -> Cil.location -> unit) -> Cil.global -> unit
val getVars : Cil.file -> Cil.global list
val convertVars : Cil.global list -> Cil.varinfo list
val presentIn : Cil.varinfo list -> Cil.varinfo -> bool
type lock = Cil.lhost
type lockT = {
  fname : string;
  line : int;
  var : string;
  locklist : lock list;
}
val lock_set : lockT list ref
val l2v : lock -> string
val l2v_list : lock list -> string
val lock_list_pretty : unit -> lock list -> Pretty.doc
val remove : lock list -> lock -> lock list
val isin : lock list -> lock -> bool
val intersection : lock list -> lock list -> lock list
val lock_list_add : lock list -> lock -> lock list
val lock_list_add_all : lock list -> Cil.exp list -> lock list
val lock_list_remove : lock list -> lock -> lock list
val lock_list_remove_all : lock list -> Cil.exp list -> lock list
val lock_list_handle_inst : Cil.instr -> lock list -> lock list
module LockSetDF :
  sig
    val name : string
    val debug : bool ref
    type t = lock list
    val copy : 'a -> 'a
    val stmtStartData : lock list IH.t
    val pretty : unit -> lock list -> Pretty.doc
    val computeFirstPredecessor : 'a -> 'b -> 'b
    val combinePredecessors : Cil.stmt -> old:t -> t -> lock list option
    val doInstr : Cil.instr -> t -> lock list DF.action
    val doStmt : 'a -> 'b -> 'c DF.stmtaction
    val doGuard : 'a -> 'b -> 'c DF.guardaction
    val filterStmt : 'a -> bool
  end
module LockSet : sig val compute : Cil.stmt list -> unit end
val computeLockSet : Cil.fundec -> unit
val getLockSet : int -> lock list option
val instrLockSet : Cil.instr list -> lock list -> lock list list
class llVisitorClass :
  object
    val mutable current_state : lock list option
    val mutable sid : int
    val mutable state_list : lock list list
    method get_cur_ll : unit -> lock list option
    method queueInstr : Cil.instr list -> unit
    method unqueueInstr : unit -> Cil.instr list
    method vattr : Cil.attribute -> Cil.attribute list Cil.visitAction
    method vattrparam : Cil.attrparam -> Cil.attrparam Cil.visitAction
    method vblock : Cil.block -> Cil.block Cil.visitAction
    method vexpr : Cil.exp -> Cil.exp Cil.visitAction
    method vfunc : Cil.fundec -> Cil.fundec Cil.visitAction
    method vglob : Cil.global -> Cil.global list Cil.visitAction
    method vinit :
      Cil.varinfo -> Cil.offset -> Cil.init -> Cil.init Cil.visitAction
    method vinitoffs : Cil.offset -> Cil.offset Cil.visitAction
    method vinst : Cil.instr -> Cil.instr list Cil.visitAction
    method vlval : Cil.lval -> Cil.lval Cil.visitAction
    method voffs : Cil.offset -> Cil.offset Cil.visitAction
    method vstmt : Cil.stmt -> Cil.stmt Cil.visitAction
    method vtype : Cil.typ -> Cil.typ Cil.visitAction
    method vvdec : Cil.varinfo -> Cil.varinfo Cil.visitAction
    method vvrbl : Cil.varinfo -> Cil.varinfo Cil.visitAction
  end
class varUseReporterClass :
  object
    val mutable current_state : lock list option
    val mutable sid : int
    val mutable state_list : lock list list
    method get_cur_ll : unit -> lock list option
    method queueInstr : Cil.instr list -> unit
    method unqueueInstr : unit -> Cil.instr list
    method vattr : Cil.attribute -> Cil.attribute list Cil.visitAction
    method vattrparam : Cil.attrparam -> Cil.attrparam Cil.visitAction
    method vblock : Cil.block -> Cil.block Cil.visitAction
    method vexpr : Cil.exp -> Cil.exp Cil.visitAction
    method vfunc : Cil.fundec -> Cil.fundec Cil.visitAction
    method vglob : Cil.global -> Cil.global list Cil.visitAction
    method vinit :
      Cil.varinfo -> Cil.offset -> Cil.init -> Cil.init Cil.visitAction
    method vinitoffs : Cil.offset -> Cil.offset Cil.visitAction
    method vinst : Cil.instr -> Cil.instr list Cil.visitAction
    method vlval : Cil.lval -> Cil.lval Cil.visitAction
    method voffs : Cil.offset -> Cil.offset Cil.visitAction
    method vstmt : Cil.stmt -> Cil.stmt Cil.visitAction
    method vtype : Cil.typ -> Cil.typ Cil.visitAction
    method vvdec : Cil.varinfo -> Cil.varinfo Cil.visitAction
    method vvrbl : Cil.varinfo -> Cil.varinfo Cil.visitAction
  end
val lockSetAnalysis : Cil.fundec -> Cil.location -> unit
val mainls : Cil.file -> unit
val feature : Feature.t
