use core::task;
use std::cmp; // Import the `cmp` module for comparison functions

// Calcuate the WCRT of the block
// Input is all block list
use crate::hardcode::Block;

pub fn loop_block(
    init_li: f64,
    current_li: f64,
    prev_li: f64,
    block: &Block,
    all_block_list: Vec<Vec<&Block>>,
    task_number: usize,
) {
    // println!("{:?}", current_li);
    // println!("{:?}", prev_li);
    println!("{:?}", block.block_type);
    let mut prio = block.priority;
    let mut task_list: Vec<&Block> = Vec::new();

    for task in all_block_list {
        task_list.push(task[0]);
    }

    let mut high_tasks: Vec<&Block> = Vec::new();

    for task in task_list {
        if task.priority > prio {
            high_tasks.push(task);
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
        let mut cij = input_block.wcet;
        let mut prio = input_block.priority;
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
        let mut wcrt = loop_block(
            cij + waiting_time,
            cij + waiting_time,
            0.0,
            input_block,
            all_block_list,
            task_number,
        );

        return 0.0;
    }
}
pub fn calculate_wcrt(all_block_list: Vec<Vec<&Block>>) {
    for (i, block_list) in all_block_list.iter().enumerate() {
        for (j, block) in block_list.iter().enumerate() {
            calculate_wcrt_block(block, all_block_list.clone(), i, j);
        }
    }
}
