// src/main.rs
use std::fs;
use std::io;
use std::path::Path;

mod parse;
mod schema;
mod wcrt;

use indexmap::IndexMap; // Import IndexMap
use parse::get_blocks;
use schema::Block;
use wcrt::calculate_wcrt;

fn wcrt_calculation(path: &Path) -> io::Result<()> {
    let c_code = fs::read_to_string(&path)?;
    let blocks: Vec<IndexMap<u32, Block>> = get_blocks(c_code.as_str());

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
    Ok(())
}

fn visit_dirs(dir_path: &Path) -> io::Result<()> {
    // visit_dirs(dir_path);
    if dir_path.is_dir() {
        for entry in fs::read_dir(dir_path)? {
            let entry = entry?;
            let path = entry.path();
            if path.is_dir() {
                visit_dirs(&path)?;
            } else {
                wcrt_calculation(&path)?;
            }
        }
    }
    Ok(())
}

fn main() -> io::Result<()> {
    let dir_path: &Path = Path::new("/home/siddhesh/Desktop/Siddhesh/Nested Lock WCRT/nested_locks_new/extended_impl/program_files");

    visit_dirs(dir_path)?;
    Ok(())
}
