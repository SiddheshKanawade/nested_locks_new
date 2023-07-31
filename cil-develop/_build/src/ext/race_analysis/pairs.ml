let getPairs lst =
  let rec loop1 l1 =
    match l1 with
      [] -> []
    | h :: t ->
      let rec loop2 = function
        [] -> []
      | h' :: t' -> (h, h') :: (loop2 t')
      in
      (loop2 t) @ (loop1 t)
  in
  loop1 lst

let printlist l = List.iter (fun x -> print x) l

let plist l = List.iter (fun ll -> printlist ll) l

let display_list l =
	let f elem =
    	  Printf.printf "element %d\n" elem
  	in
          List.iter f l


let test () = 
  printlist [10;4;2;9]
  

let _ = test ()

(*
  Open OCaml top-level or utop.
  Type: #use "pairs.ml"
  Type: getPairs [10; 4; 2; 9];;
*)

