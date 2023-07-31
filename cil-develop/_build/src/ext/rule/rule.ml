(*Print function names of a program*)

(* Make sure that there is exactly one Return statement in the whole body. 
 * Replace all the other returns with Goto. This is convenient if you later 
 * want to insert some finalizer code, since you have a precise place where 
 * to put it *)
open Cil
open Feature
open Pretty

module E = Errormsg

let dummyVisitor = new nopCilVisitor

let rule (f: Cil.fundec) = 
  let fname = f.svar.vname in
   E.log "Function name: %s\n" 
                  f.svar.vname
        
      
let feature = 
  { fd_name = "rule";
    fd_enabled = false;
    fd_description = "print function names" ;
    fd_extraopt = [];
    fd_doit = (function (f: file) -> 
      Cil.iterGlobals f (fun glob -> match glob with
        Cil.GFun(fd,_) -> rule fd; 
      | _ -> ()));
    fd_post_check = true;
  } 

let () = Feature.register feature
