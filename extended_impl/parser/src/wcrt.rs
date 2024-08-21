// Calcuate the WCRT of the block
// Input is all block list
use crate::hardcode::Block;

pub fn calculate_wcrt(all_block_list: Vec<Vec<&Block>>) {
    println!("Calculating WCRT");
    for block_list in all_block_list.iter() {
        println!("{:?}", block_list);
    }
}
