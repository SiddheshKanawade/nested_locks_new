// src/hardcode.rs

use std::collections::HashMap;

#[derive(Debug)]
pub struct Block {
    pub block_type: String,
    pub wcet: f64,
    // pub wcrt: f64,
    pub time_period: u32,
    pub priority: u32,
    pub nested: Vec<u32>,
}

pub fn get_blocks() -> Vec<HashMap<u32, Block>> {
    let mut blocks: Vec<HashMap<u32, Block>> = Vec::new();

    let mut block1 = HashMap::new();
    block1.insert(
        0,
        Block {
            block_type: String::from("TaskMainDisplayTask"),
            wcet: 0.411,
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
            time_period: 250,
            priority: 10,
            nested: vec![],
        },
    );
    blocks.push(block1);

    let mut block2 = HashMap::new();
    block2.insert(
        0,
        Block {
            block_type: String::from("TaskMainColorSensorTask"),
            wcet: 0.068,
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
            time_period: 100,
            priority: 2,
            nested: vec![],
        },
    );
    blocks.push(block2);

    let mut block3 = HashMap::new();
    block3.insert(
        0,
        Block {
            block_type: String::from("TaskMainSonarSensorTask"),
            wcet: 0.114,
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
            time_period: 100,
            priority: 5,
            nested: vec![],
        },
    );
    blocks.push(block3);

    let mut block4 = HashMap::new();
    block4.insert(
        0,
        Block {
            block_type: String::from("TaskMainMotorControlTask"),
            wcet: 0.074,
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
            time_period: 50,
            priority: 1,
            nested: vec![],
        },
    );
    blocks.push(block4);

    blocks
}
