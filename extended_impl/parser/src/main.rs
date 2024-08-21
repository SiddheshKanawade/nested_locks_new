// src/main.rs
use std::path::Path;

mod hardcode;
mod parse;
mod wcrt;

use hardcode::{get_blocks, Block};
use indexmap::IndexMap; // Import IndexMap
use parse::visit_dirs;
use wcrt::calculate_wcrt;

fn main() {
    let dir_path = Path::new("/home/siddhesh/Desktop/Siddhesh/Nested Lock WCRT/nested_locks_new/extended_impl/program_files");

    visit_dirs(dir_path);

    let blocks: Vec<IndexMap<u32, Block>> = get_blocks();

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
