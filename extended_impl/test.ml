type task = { tname: string; priority: int }
type task_lock = { task_name: string; lock_name:string }

let rec add_task_locks task_lock_list task block_list =
  match block_list with
  | [] -> task_lock_list
  | blk :: rest ->
    if blk.task_name = task.tname then
      add_task_locks (blk :: task_lock_list) task rest
    else
      add_task_locks task_lock_list task rest

(*Following calculates Lkj, if k>=i. It appends all the locks to the list*)
let rec get_tk_lks_list_high_priority tk blk_lk task_list block_list =
  let rec loop task_lock_list = function
    | [] -> task_lock_list
    | task :: rest ->
      if task.priority >= tk.priority then
        let updated_lock_list = add_task_locks task_lock_list task block_list in
        loop updated_lock_list rest
      else
        loop task_lock_list rest
  in
  loop [] task_list

(* Example usage and test *)
let example_task_list = [
  { tname = "Task1"; priority = 3 };
  { tname = "Task2"; priority = 5 };
  { tname = "Task3"; priority = 2 };
  { tname = "Task4"; priority = 4 };
  { tname = "Task5"; priority = 5 };
]

let example_block_list = [
  { task_name = "Task2"; lock_name="L1" };
  { task_name = "Task4"; lock_name="L2" };
  { task_name = "Task6"; lock_name="L3" };
]

let tk = { tname = "Task2"; priority = 4 }

let task_locks = get_tk_lks_list_high_priority tk [] example_task_list example_block_list

(* Print the obtained task locks *)
let () =
  List.iter (fun lock -> print_endline lock.lock_name) task_locks
