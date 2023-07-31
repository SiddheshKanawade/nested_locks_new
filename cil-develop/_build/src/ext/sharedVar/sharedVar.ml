open Cil
open Feature
open Pretty
open Printf
module E = Errormsg
let dummyVisitor = new nopCilVisitor
(*let onlyFunctions (fn : fundec -> location -> unit) (g : global) : unit = 
  match g with
  | GFun(f, loc) -> fn f loc
  | _ -> ()

let lockSetAnalysis (fd : fundec) (loc : location) : unit =
 currFun.funName <- fd.svar.vname;
 computeLockSet fd;

 let vis = ((new varUseReporterClass) :> nopCilVisitor) in                                  
 ignore(visitCilFunction vis fd)*)

(*let print_name (v : varinfo) : unit =
	E.log "%s \n" v.vname;
	compute_CAaccess v;*)
(*
let rule (f: Cil.fundec) = 
  let fname = f.svar.vname in
   E.log "Function name: %s\n" f.svar.vname;

let check_globs (g : global) : unit =
	match g with
	| GVar(fd,_,_) -> rule fd;
	| _ -> ();
  
let analysis (f : file) : unit  =
   uniqueVarNames f;
   Cfg.computeFileCFG f;
   iterGlobals f check_globs;
   (*iterGlobals f (onlyFunctions lockSetAnalysis);
   Printf.sprintf ("Analysis");;*)

let feature = 
   fd_name = "sharedVar";
    fd_enabled = false;
    fd_description = "print sharedVar names" ;
    fd_extraopt = [];
	fd_doit = (function (f: file) -> 
      Cil.iterGlobals f (fun glob -> match glob with
        Cil.GFun(fd,_) -> rule fd; 
      | _ -> ()));
    (*fd_doit = analysis;*)
    (* fd_doit = (function (f: file) -> 
      Cil.iterGlobals f (fun glob -> match glob with
        Cil.GVar(fd,_,_) -> sharedVar fd; 
      | _ -> ()));*)
    fd_post_check = true;
  
let () = Feature.register feature*)

let rule (f: Cil.varinfo) = 
  if f.vglob == true then
	E.log "Vname: %s\n" f.vname
   
        
      
let feature = 
  { fd_name = "sharedVar";
    fd_enabled = false;
    fd_description = "print var names" ;
    fd_extraopt = [];
    (*fd_doit = (function (f: file) -> 
      Cil.iterGlobals f (fun glob -> match glob with
        Cil.GFun(fd,_) -> rule fd; 
      | _ -> ()));*)
    fd_doit = (function (f: file) -> 
      Cil.iterGlobals f (fun glob -> match glob with
        Cil.GVar(fd,_,_) -> rule fd; 
      | _ -> ()));
    fd_post_check = true;
  } 

let () = Feature.register feature
