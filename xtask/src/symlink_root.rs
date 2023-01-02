use std::fs;
use std::io;
use std::io::Read;
use std::path::Path;

use regex::Regex;

const SKIPPED_FILES: &[&str] = &["readme.md", ".gitignore"];

pub fn symlink_root<P: AsRef<Path>>(xtask_root: P) -> io::Result<()> {
  let xtask_root = fs::canonicalize(xtask_root)?;
  let symlink_directory = xtask_root.join("symlink");
  let root_directory = fs::canonicalize(xtask_root.join("../"))?;
  let mut symlinks: Vec<String> = vec![];

  println!("root_directory: {root_directory:?}");
  println!("symlink_directory: {symlink_directory:?}");
  println!("xtask_root: {xtask_root:?}");

  for entry in fs::read_dir(&symlink_directory)? {
    let entry = entry?;
    let file_name = entry.file_name().to_string_lossy().to_string();

    if SKIPPED_FILES.contains(&entry.file_name().to_str().unwrap()) {
      continue;
    }

    let link = root_directory.join(file_name.as_str());

    if link.exists() {
      continue;
    }

    #[cfg(unix)]
    {
      std::os::unix::fs::symlink(entry.path(), &link)?;
      println!("symlink performed on unix: {:?}", &link);
    }

    #[cfg(windows)]
    {
      if entry.file_type()?.is_file() {
        std::os::windows::fs::symlink_file(entry.path(), &link)?;
        println!("symlink performed on windows: {:?}", &link);
      } else {
        std::os::windows::fs::symlink_dir(entry.path(), &link)?;
        println!("symlink performed on windows: {:?}", &link);
      }
    }
  }

  for entry in fs::read_dir(&root_directory)? {
    let entry = entry?;

    if !entry.file_type()?.is_symlink() {
      continue;
    }

    match fs::canonicalize(entry.path()) {
      Ok(link) => {
        println!("symlink found: {:?}", &link);
        symlinks.push(entry.file_name().into_string().unwrap());
      }
      Err(error) => {
        println!(
          "symlink broken: {:?}, with error: {:?}",
          entry.path(),
          error.to_string()
        );
        fs::remove_file(entry.path())?;
      }
    }
  }

  let gitignore = root_directory.join(".gitignore");
  let mut file = fs::File::open(&gitignore).expect("gitignore file not found");
  let regex = Regex::new(r"(?ms)#\s*START SYMLINK.+#\s*END SYMLINK").unwrap();
  let ignored_symlink_files = if symlinks.is_empty() {
    "".to_string()
  } else {
    format!("# START SYMLINK\n{}\n# END SYMLINK", symlinks.join("\n"))
  };
  let mut contents = String::new();
  file
    .read_to_string(&mut contents)
    .expect("failed to read gitignore");

  let replacement = if regex.is_match(contents.as_str()) {
    regex
      .replace(contents.trim(), ignored_symlink_files)
      .to_string()
  } else if symlinks.is_empty() {
    return Ok(());
  } else {
    format!("{}\n\n{}", contents.trim(), ignored_symlink_files)
  };

  // println!("{}", replacement);

  fs::write(&gitignore, replacement)?;

  Ok(())
}

#[cfg(test)]
mod tests {
  use super::*;

  #[test]
  fn it_works() {
    symlink_root(std::path::PathBuf::from("./")).unwrap();
  }
}
