use crate::client::call_contract;
use crate::client::Output;

const PACKAGE_ID: &str = "0xf829046edd3b358918c40ac568688d40cdc855203db36367855bbcd5fb1e001f";
const MODULE: &str = "Events";

pub async fn emit_event(identity: &str, event: &str) -> anyhow::Result<Output> {
    let args = vec![identity.to_string(), event.to_string()];
    call_contract(PACKAGE_ID, MODULE, "emit_event", args).await
}

pub async fn get_events(identity: &str) -> anyhow::Result<Output> {
    let args = vec![identity.to_string()];
    call_contract(PACKAGE_ID, MODULE, "get_events", args).await
}
