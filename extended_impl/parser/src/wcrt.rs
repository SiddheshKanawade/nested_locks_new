// Import the `cmp` module for comparison functions

// Calcuate the WCRT of the block
// Input is all block list
use crate::schema::Block;

static THRESHOLD: f64 = 0.001;

pub fn equalsf(x: f64, y: f64) -> bool {
    return (x - y).abs() < THRESHOLD;
}

pub fn is_sat_eq2(init_li: f64, current_li: f64, high_tasks: Vec<&Block>) -> bool {
    let mut new_li = init_li;

    for task in high_tasks {
        let time_period = task.time_period as f64;
        let wcet = task.wcet;
        new_li += (current_li / time_period).ceil() * wcet;
    }

    if equalsf(current_li, new_li) {
        return true;
    } else {
        return false;
    }
}

pub fn compute_l_ilk(current_li: f64, prev_li: f64, high_tasks: Vec<&Block>) -> f64 {
    let mut new_li = current_li;

    for task in high_tasks {
        let time_period = task.time_period as f64;
        let wcet = task.wcet;
        new_li += (current_li / time_period).ceil() * wcet;
        new_li -= (prev_li / time_period).ceil() * wcet;
    }

    return new_li;
}

pub fn loop_block(
    init_li: f64,
    current_li: f64,
    prev_li: f64,
    block: &Block,
    all_block_list: Vec<Vec<&Block>>,
    task_number: usize,
) -> f64 {
    // println!("{:?}", current_li);
    // println!("{:?}", prev_li);
    let prio = block.priority;
    let mut task_list: Vec<&Block> = Vec::new();

    for task in all_block_list.iter() {
        task_list.push(task[0]);
    }

    let mut high_tasks: Vec<&Block> = Vec::new();

    for task in task_list {
        if task.priority > prio {
            high_tasks.push(task);
        }
    }

    if !is_sat_eq2(init_li, current_li, high_tasks.clone()) && current_li < block.time_period as f64
    {
        // Calculate new li
        let new_l_ilk = compute_l_ilk(current_li, prev_li, high_tasks);
        return loop_block(
            init_li,
            new_l_ilk,
            current_li,
            block,
            all_block_list,
            task_number,
        );
    } else {
        if current_li >= block.time_period as f64 {
            println!("Block {:?} is not schedulable", block.block_type);
            return -1.0;
        } else {
            return current_li;
        }
    }
}

pub fn calculate_wcrt_block(
    input_block: &Block,
    all_block_list: Vec<Vec<&Block>>,
    task_number: usize,
    block_number: usize,
) -> f64 {
    // println!(
    //     "{:?} {:?} {:?}",
    //     block.block_type, task_number, block_number
    // );

    if input_block.wcrt != 0.0 {
        return input_block.wcrt;
    } else {
        let cij = input_block.wcet;
        let prio = input_block.priority;
        let mut locks: Vec<String> = Vec::new();

        for task in all_block_list.iter() {
            if task[0].priority <= prio {
                continue;
            }
            for block in task.iter() {
                if block.block_type == input_block.block_type {
                    for _ in input_block.nested.iter() {
                        locks.push(block.block_type.clone());
                    }
                }
            }
        }

        for nested in input_block.nested.iter() {
            locks.push(
                all_block_list[task_number][*nested as usize]
                    .block_type
                    .clone(),
            ); // In script.py we did +=
        }

        let mut waiting_time = 0.0;
        for lock in locks.iter() {
            let mut time = 0.0;
            for (i, task) in all_block_list.iter().enumerate() {
                if task[0].priority >= prio {
                    continue;
                }
                for (j, block) in task.iter().enumerate() {
                    if block.block_type == *lock {
                        // Call funtion here to calculate wcrt of block
                        time = f64::max(
                            time,
                            calculate_wcrt_block(block, all_block_list.clone(), i, j),
                        );
                    }
                }
            }
            waiting_time += time;
        }

        // Implement loop. IF got issue, check this.
        let wcrt = loop_block(
            cij + waiting_time,
            cij + waiting_time,
            0.0,
            input_block,
            all_block_list.clone(),
            task_number,
        );

        println!("{:?}", all_block_list[task_number][block_number].block_type);
        println!("{:?}", wcrt);

        return wcrt;
    }
}
pub fn calculate_wcrt(all_block_list: Vec<Vec<&Block>>) {
    for (i, block_list) in all_block_list.iter().enumerate() {
        for (j, block) in block_list.iter().enumerate() {
            calculate_wcrt_block(block, all_block_list.clone(), i, j);
        }
    }
}
