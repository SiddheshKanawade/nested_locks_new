// src/main.rs

mod hardcode;
mod wcrt;

use hardcode::{get_blocks, Block};
use std::collections::HashMap;
use wcrt::calculate_wcrt;

fn main() {
    let blocks: Vec<HashMap<u32, Block>> = get_blocks();

    for (i, block_map) in blocks.iter().enumerate() {
        println!("Block {}: ", i);
        for (key, block) in block_map.iter() {
            println!("  Key: {}", key);
            println!("  Type: {}", block.block_type);
            println!("  WCET: {}", block.wcet);
            println!("  Time Period: {}", block.time_period);
            println!("  Priority: {}", block.priority);
            println!("  Nested: {:?}", block.nested);
        }
    }

    // Generate block list
    let mut all_block_list: Vec<Vec<&Block>> = Vec::new();

    for block_map in blocks.iter() {
        let mut block_list: Vec<&Block> = Vec::new();
        for (_, block) in block_map.iter() {
            block_list.push(block);
        }
        all_block_list.push(block_list);
    }

    // Calculate WCRT
    calculate_wcrt(all_block_list);
}
