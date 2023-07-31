open Cil
open Feature
open Pretty
open Printf
module E = Errormsg

let dummyVisitor = new nopCilVisitor

(*let display (v: varinfo) = 
	E.log "Vname: %s\n" v.vname;

let check_globs (v : varinfo -> initinfo -> location -> unit) (g : global) : unit =
	match g with
	(*| GVar(vi,ii,loc) -> v vi ii loc;*)
	| GVar(vi,ii,loc) -> display vi;
	| _ -> ();
		
let mainls (f : file) : unit  =  
   Cfg.computeFileCFG f;
   iterGlobals f (check_globs); 

let feature  =
{ fd_name = "rule2";
fd_enabled = false;
fd_description = "Analysis";
fd_extraopt = [];
fd_doit = mainls;
fd_post_check = true
}

let () = Feature.register feature*)


