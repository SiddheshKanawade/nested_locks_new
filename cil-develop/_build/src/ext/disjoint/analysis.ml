module E = Errormsg
open Cil
open Feature
open Pretty

type task = {
  tname : string;
  fname : string;
  priority : int;
  period : int;
  wcet : float;
}


(*let rec check tlist tk =
      match tlist with
        [] -> false
      | h :: t -> if (h.priority > tk.priority) then true
                  else check t tk

let rule1 (t1 : task) (t2 : task) (tasks : task list) : result =
  (*print_endline "Applying rule 1 ...";*)
  if (t1.priority = t2.priority) && (not (check tasks t1)) then true
  else false*)

(*let rec display_taskList l =
  let display i =
       match i with
	 |(tname,fname,pr,p,wcet) -> E.log "\n(%s,%s,%d,%d,%f)\n" tname fname pr p wcet
	 |_ -> E.log "\n In else"
  in List.iter (fun x -> display x) l*)

let rec display_taskList l =
  let display i =
    E.log "%s" i.tname
       (*match i with
	 |{tname,fname,pr,p,wcet} -> E.log "\n(%s,%s,%d,%d,%f)\n" tname fname pr p wcet
	 |_ -> E.log "\n In else"*)
  in List.iter (fun x -> display x) l

let display_taskpairList l =
  let display i =
       match i with
	 |(tname,fname,pr,p,wcet),(tname',fname',pr',p',wcet') -> E.log "\n<(%s,%s,%d,%d,%f),(%s,%s,%d,%d,%f)>\n" tname fname pr p wcet tname' fname' pr' p' wcet'
	 
  in List.iter (fun x -> display x) l


   
		

let getFuncs (f : file)  =  
  List.filter (fun g ->
      match g with
      | GFun (fd, loc) -> true 
      | _ -> false )
    f.globals 

let rec convertFuncs lst =
  match lst with
    [] -> []
    | h :: t -> 
      match h with
        GFun(fd,loc) ->  [fd] @ (convertFuncs t)
	|_ -> []

let size l = 
  List.fold_left (fun acc _ -> acc + 1) 0 l

let getstrConst elem =
  match elem with
  Const(c) -> 
    match c with 
   | CStr(st) -> st
   

let getintConst elem =
  match elem with
  Const(c) -> 
    match c with 
   | CInt64(i,ik,st) -> (i64_to_int i)
   

let getfloatConst elem =
  match elem with
  [] -> 0.0
  | h::t ->
   match h with
    Const(c) -> 
      match c with 
     | CReal(f,fk,st) -> f
    

let rec findArgVar l =
  match l with
  |tn::fn::pr::p::et -> {tname = getstrConst tn;fname = getstrConst fn;priority = getintConst pr; period = getintConst p ;wcet = getfloatConst et}
(*{tname = "dinninin";fname = "s";priority = 2;period = 3;wcet = 2.0} *) 
  
  
let getTasks fd =
  let getPars st =
    match st.skind with	
      Instr(ilst) -> 
	begin
	  let rec loop1 ilist =
  	    match ilist with
	      [] -> []
	      | inst::insts -> 
       		 match inst with 
         	   Call(lv,e,el,loc) -> [(findArgVar el)] @ (loop1 insts)
  	  in loop1 ilst
	end 
     |_ ->[]
in 
  List.map (fun x -> (List.map (fun y -> getPars y) x.sbody.bstmts)) fd

  
let getTaskList f =
  let funs = getFuncs f 
in
  let fundefs = convertFuncs funs
in
  let fd_main = List.filter(fun x -> (x.svar.vname = "main")) fundefs 
in
  let tasks = getTasks fd_main
in
  (List.flatten(List.flatten(tasks)))

let getPairs lst =
    let rec loop1 = function
        [] -> []
      | h :: t ->
        (List.map (fun f -> (h, f)) t) @ (loop1 t)
    in
    loop1 lst



(*let analyse f =
  let taskList = getTaskList f
in 
  let taskPairList = getPairs taskList
in 
  
  display_taskpairList taskPairList;
  let accesspairList = findaccessPairList taskList
in
  E.log "Completed"*)

let getFuncs (f : file)  =
    List.filter (fun g ->
      match g with
      | GFun (fd, loc) -> true 
      | _ -> false )
    f.globals  

let rec convertFuncs lst =
  match lst with
    [] -> []
    | h :: t -> 
      match h with
        GFun(fd,loc) ->  [fd] @ (convertFuncs t)
	|_ -> []

let getVars (f : file)  =
  
    List.filter (fun g ->
      match g with
      | GVar(vi,i, loc) -> true 
      | _ -> false )
    f.globals
  

let rec convertVars lst =
  match lst with
    [] -> []
    | h :: t -> 
      match h with
        GVar(vi,i, loc) ->  [vi] @ (convertVars t)
	|_ -> []

let rec isin ll a =
  match ll with
    [] -> false
  | h::t when h = a -> true
  | h::t -> isin t a 

let rec findFunVar lt e =
    match e with
    | Const(c) -> []
    | Lval(v) -> (match v with
		  |(lh,off) -> match lh with
			    	Var(vi) -> if (isin lt vi) then [vi] 
			      		   else [])
    | BinOp(op,e1, e2,t) -> (findFunVar lt e1) @ (findFunVar lt e2)
    | _ -> []

let rec findExprVar e =
   match e with
    | Const(c) -> []
    | Lval(v) -> (match v with
		  |(lh,off) -> match lh with
			    	Var(vi) -> [vi] 
			      |	_ -> [])
    | BinOp(op,e1, e2,t) -> (findExprVar e1) @ (findExprVar e2)
    |UnOp(op,e,t) -> findExprVar e
    | _ -> []

let contain inst vlist =
       match inst with
         Set(lv,e,loc) -> begin
            (*let status = (isint e var) in*)
	     match lv with
             |(lh,off) -> begin
	          match lh with
	          Var(vi) ->  begin		if(isin vlist vi) then 
					begin 
					(*print_endline ("\t\t"^ vi.vname);*)
					let e_uses = (findFunVar vlist e) in
					[(loc.line,vi.vname,true,false)] @ 
					(List.map (fun x -> (loc.line,x.vname,false,true)) e_uses) 
					end
					else 
					begin
				 	let e_uses = (findFunVar vlist e) in
					[] @ (List.map (fun x -> (loc.line,x.vname,false,true)) e_uses) 
					end
			end
		    end
				
		end
	|Call(lv,e,el,loc) -> E.log "\t\t--->call entered";[]
	| _ -> E.log "Add instr kind"; []



let rec isPresent_stmt stmt vlist =
  match stmt.skind with
	      | Instr(ilst) -> List.map (fun x -> contain x vlist) ilst
	      | If(exp,blk1,blk2,loc) -> begin 
				let e_uses = findExprVar exp in
				[(List.map (fun y -> (loc.line,y.vname,false,true)) e_uses)] @ 		 List.flatten(List.map (fun z -> (isPresent_stmt z vlist)) blk1.bstmts)@ List.flatten(List.map (fun z -> (isPresent_stmt z vlist)) blk2.bstmts)
				end
 
		| _ -> (*E.log "\nAdd stmt kind";*) []

let findstmts vlist fd =
	(*display_stmtlist (List.filter (fun x -> isPresent x var) fn.sbody.bstmts);*)
	 List.map (fun x -> (isPresent_stmt x vlist)) fd.sbody.bstmts

let rec getFd fname fl =
  match fl with
  [] -> E.log "Couldn't find function by name :%s " fname
  | h::t -> match (h.svar.vname) with
		fname -> h; getFd fname t

let getStmts elem fl vl =
  match elem with
  (tname,fname,pr,p,wcet) -> 
     let current_fd = List.filter(fun x -> (x.svar.vname = fname)) fl	
	 in
let result = List.map (fun x -> findstmts vl x) current_fd in
	   let stmtList =  List.flatten(List.flatten (List.flatten (result)))
	  in 
	    let fd_accesses = List.map(fun y -> (elem,y)) stmtList in
  fd_accesses
  
  let getAccessList tl fl vl = 
  let accessList = List.map (fun x -> getStmts x fl vl) tl
  in
   List.flatten(accessList)

let rec display_AccessList lst =
  match lst with
  | [] -> ()
  | ((tname,fname,pr,p,wcet), (ln,var,w,r)) :: rest ->
    E.log "\n(<%s,%s,%d,%s>)" tname fname ln var;
    display_AccessList rest

let getConflict x =
match x with
     (((tname,fname,pr,p,wcet), (ln,var,w,r)),((tname',fname',pr',p',wcet'), (ln',var',w',r')))
     -> if ((not(tname=tname'))&&(var=var')&&((w=true)||(w'=true))) then true
	 else false
	 
  let getCAPairs al =
   let pairs = getPairs al
   in List.filter (fun x -> getConflict x) pairs

let get_access b =
  if (b=true) then "write" 
	else "read" 
  
  let display_CA elem =
    match elem with
     (((tname,fname,pr,p,wcet), (ln,var,w,r)),((tname',fname',pr',p',wcet'), (ln',var',w',r')))
     -> let access = get_access w and access' = get_access w' in
    
       E.log "\n(<%s,%s,%d,%s,%s>,<%s,%s,%d,%s,%s>)" tname fname ln var access tname' fname' ln' var' access'
  




let analyse f =
  let funs = getFuncs f and svars = getVars f 
 in
  let fundecs = convertFuncs funs and gVars = convertVars svars  
 in 
  let fundecs_filter = List.filter(fun x -> not(x.svar.vname = "main")) fundecs
  and taskList = getTaskList f
 in 
  display_taskList taskList;
  E.log "Completeed"
  (*let accessList = getAccessList taskList fundecs_filter gVars
 in
  let conflictAccessPairs = getCAPairs accessList
  in
  E.log "Completed";
  List.iter (fun x -> display_CA x) conflictAccessPairs 
  display_AccessList accessList*)


let mainls (f : file) =
  analyse f 

let feature  =
{ fd_name = "analysis";
fd_enabled = false;
fd_description = "analysis";
fd_extraopt = [];
fd_doit = mainls;
fd_post_check = true
}

let () = Feature.register feature
