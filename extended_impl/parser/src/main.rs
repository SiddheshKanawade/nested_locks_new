use regex::Regex;
use std::any::type_name;
use std::fs;

fn print_type_of<T>(_: &T) {
    println!("{}", type_name::<T>());
}

fn main() {
    let file_path = "/home/siddhesh/Desktop/Siddhesh/Nested Lock WCRT/nested_locks_new/extended_impl/program_files/fse_obstacle.c";
    let code = fs::read_to_string(file_path).expect("Error reading file"); // code -> String

    let re =
        Regex::new(r"create_task\((\'.*?\'),\s*(\'.*?\'),\s*(\d+),\s*(\d+),\s*([\d.]+)\)").unwrap();

    for cap in re.captures_iter(&code) {
        let param1 = &cap[1];
        let param2 = &cap[2];
        let param3 = &cap[3];
        let param4 = &cap[4];
        let param5 = &cap[5];

        println!("create_task parameters:");
        println!("  Param 1: {}", param1);
        println!("  Param 2: {}", param2);
        println!("  Param 3: {}", param3);
        println!("  Param 4: {}", param4);
        println!("  Param 5: {}", param5);
    }
}
