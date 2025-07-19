use crate::client::call_contract;
use crate::client::Output;

const PACKAGE_ID: &str = "0xf829046edd3b358918c40ac568688d40cdc855203db36367855bbcd5fb1e001f";
const MODULE: &str = "RBAC";

pub async fn assign_role(identity: &str, role: &str) -> anyhow::Result<Output> {
    let args = vec![identity.to_string(), role.to_string()];
    call_contract(PACKAGE_ID, MODULE, "assign_role", args).await
}

pub async fn has_role(identity: &str, role: &str) -> anyhow::Result<Output> {
    let args = vec![identity.to_string(), role.to_string()];
    call_contract(PACKAGE_ID, MODULE, "has_role", args).await
}
