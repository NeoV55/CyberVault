use anyhow::Result;
use std::process::Command;

#[derive(Debug)]
pub struct Output {
    pub stdout: String,
    pub stderr: String,
}

pub async fn call_contract(
    package: &str,
    module: &str,
    function: &str,
    args: Vec<String>,
) -> Result<Output> {
    let mut cmd = Command::new("iota");
    cmd.arg("client")
        .arg("call")
        .arg("--package")
        .arg(package)
        .arg("--module")
        .arg(module)
        .arg("--function")
        .arg(function);

    for arg in args {
        cmd.arg("--args").arg(arg);
    }

    let output = cmd.output()?;
    Ok(Output {
        stdout: String::from_utf8_lossy(&output.stdout).to_string(),
        stderr: String::from_utf8_lossy(&output.stderr).to_string(),
    })
}
