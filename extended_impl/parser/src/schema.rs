// src/hardcode.rs

#[derive(Debug, Clone)]
pub struct Block {
    pub block_type: String,
    pub get_resource_line_number: u32,
    pub release_resource_line_number: u32,
    pub wcet: f64,
    pub wcrt: f64,
    pub time_period: u32,
    pub priority: u32,
    pub nested: Vec<u32>,
}
