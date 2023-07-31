module E = Errormsg
open Cil
open Feature
open Pretty
open Printf
open List

let display_list1 l =
  let f elem =
    	  E.log "\tLock name : %s" elem
  	in
          List.iter f l

let display_list l =
  let f elem =
    	  E.log "\t%s" elem.tname
  	in
          List.iter f l

let display_blkList l =
  let f elem =
    	  E.log "\nBlock ---------->%s , %d" elem.New.tid elem.pr;
	  Printf.printf "%f" elem.c
  	in
          List.iter f l

let display_rt l =
  let f elem =
    	  E.log "\nTask ---------->%s , %d" elem.New.tid elem.pr;
	   Printf.printf "%f" elem.c
  	in
          List.iter f l


let display_vlist l =
  List.iter (fun g -> 
    match g with
    | GVar (var,i, loc) -> print_endline (var.vname) 
    | _ -> failwith "no var") l

let display_varlist l =
  (*match l with
  [] -> E.log "\n Empty var list"
  | _ ->*)
  let f elem =
    	  E.log "\n%s" elem.vname
  	in
          List.iter f l

let rec display_pairs tp =
  match tp with
  | [] -> ()
  | (a, b) :: rest ->
   E.log "\n(Function pair : %s, %s); " a.svar.vname b.svar.vname;
    display_pairs rest

let rec display_pairlist tp =
  match tp with
  | [] -> ()
  | (a, b) :: rest ->
    E.log "\n\n(%s, %s) " a b;
    display_pairlist rest

let rec display_taskpair tp =
  match tp with
  | [] -> E.log "Empty task pair"
  | (a, b) :: rest -> 
    E.log "\n\n(%s, %s) " a.tname b.tname;
    display_taskpair rest

let rec display_funpair tp =
  match tp with
  | [] -> ()
  | (a, b) :: rest ->
    E.log "\n\n(%s, %s) " a.svar.vname b.svar.vname;
    display_funpair rest

let rec display_tfpairlist tf =
  match tf with
  | [] -> ()
  | (a, b) :: rest ->
    E.log "\n\n(%s, %s) " a.tname b.svar.vname;
    display_tfpairlist rest

let rec display_pairpairlist tp =
  match tp with
  | [] -> ()
  | ((a,a'), (b,b')) :: rest ->
    E.log "\n\n((%s, %s),(%s , %s)) " a.tname a'.tname b.svar.vname b'.svar.vname;
    display_pairpairlist rest




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

let display_accesspair ap =
   match ap with
    |((a, (h,i,j,k)),(a', (h',i',j',k'))) -> 
   	  let access = get_access j and access' = get_access j' 
	  in
       E.log "\n(<%s,%d,%s,%s>,<%s,%d,%s,%s>)" a h i access a' h' i' access'
	

let rec display_fndec l =
  match l with
    [] -> print_endline "empty"
    | h :: t -> print_endline (h.svar.vname); display_fndec t

let rec display_strList l =
  match l with
    [] -> print_endline "empty"
    | h :: t -> E.log "%d" h; display_strList t

let rec display_constlist l =
  match l with
    [] -> E.log "null"
    | h :: t -> 
	begin
	  match h with
		| CInt64(i,ik,st) -> 
		  begin
			match ik with
			  | IInt -> E.log "\nIint"  ; display_constlist t
		      | _ -> E.log "Enter ikind"
		  end
		| CStr(st) -> E.log "string" 
		| _ -> E.log "Enter constant type"
	end

let displayTaskFun taskfunList =
  let lt = List.iter (fun (t,f) -> (E.log "(%s,%s)" t.tname f.svar.vname)) taskfunList
in
  lt 



			
