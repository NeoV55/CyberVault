module 0x0::Notarization {
    use iota::object::{UID, new};
    use iota::tx_context::{TxContext, sender};
    use iota::transfer::transfer;
    use std::vector;

    public struct NotarizedDoc has key, store {
        id: UID,
        doc_hash: vector<u8>,
        timestamp: u64,
        owner: address,
    }

    public entry fun notarize(doc_hash: vector<u8>, timestamp: u64, ctx: &mut TxContext) {
        let doc = NotarizedDoc {
            id: new(ctx),
            doc_hash,
            timestamp,
            owner: sender(ctx),
        };
        transfer(doc, sender(ctx));
    }

    // Optional: if you have the UID, you can check existence like this
    // public fun has_doc(id: address): bool {
    //     exists<NotarizedDoc>(id)
    // }

    public fun get_doc(doc: &NotarizedDoc): (vector<u8>, u64) {
        (doc.doc_hash, doc.timestamp)
    }
}
