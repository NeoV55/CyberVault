use crate::client::call_contract;
use crate::client::Output;

const PACKAGE_ID: &str = "0xf829046edd3b358918c40ac568688d40cdc855203db36367855bbcd5fb1e001f";
const MODULE: &str = "Policy";

pub async fn is_permitted(identity: &str, action: &str) -> anyhow::Result<Output> {
    let args = vec![identity.to_string(), action.to_string()];
    call_contract(PACKAGE_ID, MODULE, "is_permitted", args).await
}

pub async fn min_length(resource: &str) -> anyhow::Result<Output> {
    let args = vec![resource.to_string()];
    call_contract(PACKAGE_ID, MODULE, "min_length", args).await
}
