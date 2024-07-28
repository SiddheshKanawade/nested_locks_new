let isSat_eqn2 lij tsk tasklist blklist = 
  



  let isSat_eqn8 l_ilk blk tasklist = 
    let high_tasks = List.filter (fun x -> (x.priority > (getPriority blk tasklist))) tasklist 
    in  
      let new_l_ilk = blk.wcet +. (interference2 l_ilk high_tasks)
    in
      if (l_ilk = new_l_ilk) then true
      else begin schedulable := 0;false end	(* Non schedulable *)