// src/hardcode.rs

#[derive(Debug)]
pub struct Block {
    pub block_type: String,
    pub wcet: f64,
    pub wcrt: f64,
    pub time_period: u32,
    pub priority: u32,
    pub nested: Vec<u32>,
}
