module E = Errormsg
open Cil
open Feature
open Pretty
open Printf
open List

type lock_block = {
line_no : int;
task_name : string;
lock_name : string;
block_id : int;
number_occur : int
}

let get_access w =
  if (w=true) then "write" 
	else "read"

let rec display_accesspairs lst =
  match lst with
  | [] -> E.log "\n Unit"; ()
  | ((a, (h,i,j,k)),(a', (h',i',j',k'))) :: rest ->
    let access = get_access j and access' = get_access j' 
	  in
    E.log "\n(<%s,%d,%s,%s>,<%s,%d,%s,%s>)" a.svar.vname h i access a'.svar.vname h' i' access';
    display_accesspairs rest

			
