use indexmap::IndexMap;
use regex::Regex;

use crate::schema::Block;

pub fn get_blocks(c_code: &str) -> Vec<IndexMap<u32, Block>> {
    let mut blocks: Vec<IndexMap<u32, Block>> = Vec::new();

    // Regex for parsing tasks: create_task('TaskName', 'ResourceName', param1, param2, wcet);
    let task_re = Regex::new(
        r"create_task\(\s*'([^']+)'\s*,\s*'([^']+)'\s*,\s*(\d+)\s*,\s*(\d+)\s*,\s*([\d.]+)\s*\)",
    )
    .unwrap();

    // Regex for parsing blocks: create_block(block_id, 'TaskName', 'ResourceName', param1, param2, wcet);
    let block_re = Regex::new(r"create_block\(\s*(\d+)\s*,\s*'([^']+)'\s*,\s*'([^']+)'\s*,\s*(\d+)\s*,\s*(\d+)\s*,\s*([\d.]+)\s*\)").unwrap();

    for cap in task_re.captures_iter(&c_code) {
        let task_name = &cap[1];
        let priority: u32 = cap[3].parse().unwrap();
        let time_period: u32 = cap[4].parse().unwrap();
        let wcet: f64 = cap[5].parse().unwrap();

        let mut block_map = IndexMap::new();

        // Insert task into block map
        block_map.insert(
            0,
            Block {
                block_type: task_name.to_string(),
                wcet: wcet,
                wcrt: 0.0,
                time_period: time_period,
                priority: priority,
                nested: vec![],
            },
        );

        let mut key_count = 1;
        for cap in block_re.captures_iter(&c_code) {
            // Suggests the line number at which the resource was allocated
            // We don't update the nested list when resource is released as there examples are of non-nested block
            // To use this approach with nested blocks, we need to update the nested list when resource is released

            let block_line_number: usize = cap[1].parse().unwrap();
            let block_task_name = &cap[2];
            let block_resource_name = &cap[3];
            let block_priority: u32 = cap[5].parse().unwrap(); // block priority and task priority are same
            let block_wcet: f64 = cap[6].parse().unwrap();

            //  We use task time period instead of block time period

            if block_task_name == task_name {
                assert!(block_priority == priority, "Priority mismatch");
                block_map.insert(
                    key_count,
                    Block {
                        block_type: block_resource_name.to_string(),
                        wcet: block_wcet,
                        wcrt: 0.0,
                        time_period: time_period,
                        priority: block_priority,
                        nested: vec![],
                    },
                );

                // Update the nested list of the task here. Insert key_count
                if let Some(block) = block_map.get_mut(&0) {
                    block.nested.push(key_count);
                }
                key_count += 1;
            }
        }
        // Push the collected blocks for this task
        blocks.push(block_map);
    }
    blocks
}
