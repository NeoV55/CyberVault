use crate::client::call_contract;
use crate::client::Output;

const PACKAGE_ID: &str = "0xf829046edd3b358918c40ac568688d40cdc855203db36367855bbcd5fb1e001f";
const MODULE: &str = "Notarization";

pub async fn notarize(doc_hash: &str, timestamp: &str) -> anyhow::Result<Output> {
    let args = vec![doc_hash.to_string(), timestamp.to_string()];
    call_contract(PACKAGE_ID, MODULE, "notarize", args).await
}
