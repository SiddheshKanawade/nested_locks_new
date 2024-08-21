// src/hardcode.rs

use indexmap::IndexMap; // Import IndexMap

#[derive(Debug)]
pub struct Block {
    pub block_type: String,
    pub wcet: f64,
    pub wcrt: f64,
    pub time_period: u32,
    pub priority: u32,
    pub nested: Vec<u32>,
}

pub fn get_blocks() -> Vec<IndexMap<u32, Block>> {
    let mut blocks: Vec<IndexMap<u32, Block>> = Vec::new();

    let mut block1 = IndexMap::new();
    block1.insert(
        0,
        Block {
            block_type: String::from("TaskMainDisplayTask"),
            wcet: 0.411,
            wcrt: 0.0,
            time_period: 250,
            priority: 10,
            nested: vec![1],
        },
    );
    block1.insert(
        1,
        Block {
            block_type: String::from("DrivingControlResource"),
            wcet: 0.22,
            wcrt: 0.0,
            time_period: 250,
            priority: 10,
            nested: vec![],
        },
    );
    blocks.push(block1);

    let mut block2 = IndexMap::new();
    block2.insert(
        0,
        Block {
            block_type: String::from("TaskMainColorSensorTask"),
            wcet: 0.068,
            wcrt: 0.0,
            time_period: 100,
            priority: 2,
            nested: vec![1, 2],
        },
    );
    block2.insert(
        1,
        Block {
            block_type: String::from("DrivingControlResource"),
            wcet: 0.028,
            wcrt: 0.0,
            time_period: 100,
            priority: 2,
            nested: vec![],
        },
    );
    block2.insert(
        2,
        Block {
            block_type: String::from("DrivingControlResource"),
            wcet: 0.02,
            wcrt: 0.0,
            time_period: 100,
            priority: 2,
            nested: vec![],
        },
    );
    blocks.push(block2);

    let mut block3 = IndexMap::new();
    block3.insert(
        0,
        Block {
            block_type: String::from("TaskMainSonarSensorTask"),
            wcet: 0.114,
            wcrt: 0.0,
            time_period: 100,
            priority: 5,
            nested: vec![1, 2, 3, 4, 5, 6, 7, 8],
        },
    );
    block3.insert(
        1,
        Block {
            block_type: String::from("DrivingControlResource"),
            wcet: 0.019,
            wcrt: 0.0,
            time_period: 100,
            priority: 5,
            nested: vec![],
        },
    );
    block3.insert(
        2,
        Block {
            block_type: String::from("DrivingControlResource"),
            wcet: 0.018,
            wcrt: 0.0,
            time_period: 100,
            priority: 5,
            nested: vec![],
        },
    );
    block3.insert(
        3,
        Block {
            block_type: String::from("DrivingControlResource"),
            wcet: 0.01,
            wcrt: 0.0,
            time_period: 100,
            priority: 5,
            nested: vec![],
        },
    );
    block3.insert(
        4,
        Block {
            block_type: String::from("DrivingControlResource"),
            wcet: 0.018,
            wcrt: 0.0,
            time_period: 100,
            priority: 5,
            nested: vec![],
        },
    );
    block3.insert(
        5,
        Block {
            block_type: String::from("DrivingControlResource"),
            wcet: 0.012,
            wcrt: 0.0,
            time_period: 100,
            priority: 5,
            nested: vec![],
        },
    );
    block3.insert(
        6,
        Block {
            block_type: String::from("DrivingControlResource"),
            wcet: 0.019,
            wcrt: 0.0,
            time_period: 100,
            priority: 5,
            nested: vec![],
        },
    );
    block3.insert(
        7,
        Block {
            block_type: String::from("DrivingControlResource"),
            wcet: 0.022,
            wcrt: 0.0,
            time_period: 100,
            priority: 5,
            nested: vec![],
        },
    );
    block3.insert(
        8,
        Block {
            block_type: String::from("DrivingControlResource"),
            wcet: 0.019,
            wcrt: 0.0,
            time_period: 100,
            priority: 5,
            nested: vec![],
        },
    );
    blocks.push(block3);

    let mut block4 = IndexMap::new();
    block4.insert(
        0,
        Block {
            block_type: String::from("TaskMainMotorControlTask"),
            wcet: 0.074,
            wcrt: 0.0,
            time_period: 50,
            priority: 1,
            nested: vec![1],
        },
    );
    block4.insert(
        1,
        Block {
            block_type: String::from("DrivingControlResource"),
            wcet: 0.071,
            wcrt: 0.0,
            time_period: 50,
            priority: 1,
            nested: vec![],
        },
    );
    blocks.push(block4);

    blocks
}
