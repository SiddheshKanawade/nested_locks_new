open Pretty
open Cil
open Feature

module E = Errormsg

let onlyFunctions (fn : fundec -> location -> unit) (g : global) : unit = 
  match g with
  | GFun(f, loc) -> fn f loc
  | _ -> ()

let fnName (fd : fundec) (loc : location) : unit =
 ignore(printf "%s:%d:\n" fd.svar.vname loc.line)

let doit (fl: file) = 
  Cfg.computeFileCFG fl;
  iterGlobals fl (onlyFunctions fnName)


(* let doit (fl: file) = 
  (* Scan the file and find functions defined *)
  visitCilFile (object
    inherit nopCilVisitor
    method vfunc (fd: fundec) =
      printf "%s\n" fd.svar.vname;
      SkipChildren
  end) fl
*)

let rec feature = 
  { fd_name = "fNames";
    fd_enabled = false;
    fd_description = "find functions defined";
    fd_extraopt = [];
    fd_doit = doit;
    fd_post_check = true;
  } 
let () = Feature.register feature

