use regex::Regex;
use std::fs;
use std::io;
use std::path::Path;

fn process_file(file_path: &Path) -> io::Result<()> {
    println!("File: {:?}", file_path);
    // Read the contents of the file
    let code = fs::read_to_string(file_path)?;

    // Updated regex pattern to match both single and double quotes
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
    Ok(())
}

fn visit_dirs(dir: &Path) -> io::Result<()> {
    if dir.is_dir() {
        for entry in fs::read_dir(dir)? {
            let entry = entry?;
            let path = entry.path();
            if path.is_dir() {
                visit_dirs(&path)?;
            } else {
                process_file(&path)?;
            }
        }
    }
    Ok(())
}

fn main() -> io::Result<()> {
    let dir_path = Path::new("/home/siddhesh/Desktop/Siddhesh/Nested Lock WCRT/nested_locks_new/extended_impl/program_files");

    visit_dirs(dir_path)?;

    Ok(())
}
