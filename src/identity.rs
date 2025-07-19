use crate::client::call_contract;
use crate::client::Output;

const PACKAGE_ID: &str = "0xf829046edd3b358918c40ac568688d40cdc855203db36367855bbcd5fb1e001f";
const MODULE: &str = "IdentityBinding";

pub async fn register(identity: &str) -> anyhow::Result<Output> {
    let args = vec![identity.to_string()];
    call_contract(PACKAGE_ID, MODULE, "register", args).await
}

pub async fn bind(identity: &str, resource: &str) -> anyhow::Result<Output> {
    let args = vec![identity.to_string(), resource.to_string()];
    call_contract(PACKAGE_ID, MODULE, "bind", args).await
}
