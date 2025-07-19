module 0x0::IdentityBinding {
    use iota::object::{UID, new};
    use iota::tx_context::{TxContext, sender};
    use iota::transfer::transfer;
    use std::vector;

    /// Identity resource
    public struct Identity has key, store {
        id: UID,
        did: vector<u8>,
        owner: address,
    }

    /// Binding resource
    public struct Binding has key, store {
        id: UID,
        identity: vector<u8>,
        resource: vector<u8>,
        owner: address,
    }

    /// Create a new identity
    public entry fun register(did: vector<u8>, ctx: &mut TxContext) {
        let identity = Identity {
            id: new(ctx),
            did,
            owner: sender(ctx),
        };
        transfer(identity, sender(ctx));
    }

    /// Bind an identity to a resource
    public entry fun bind(identity: vector<u8>, resource: vector<u8>, ctx: &mut TxContext) {
        let binding = Binding {
            id: new(ctx),
            identity,
            resource,
            owner: sender(ctx),
        };
        transfer(binding, sender(ctx));
    }

    /// Get DID from identity
    public fun get_did(identity: &Identity): vector<u8> {
        identity.did
    }

    /// Get binding info
    public fun get_binding(binding: &Binding): (vector<u8>, vector<u8>) {
        (binding.identity, binding.resource)
    }
}
