module 0x0::RBAC {
    use iota::object::{UID, new};
    use iota::tx_context::{TxContext, sender};
    use iota::transfer::transfer;
    use std::vector;

    public struct Role has key, store {
        id: UID,
        name: vector<u8>,
        permissions: vector<vector<u8>>,
        owner: address,
    }

    public struct RoleAssignment has copy, drop, store {
        did: vector<u8>,
        role: vector<u8>,
    }

    public struct RoleStore has key, store {
        id: UID,
        assignments: vector<RoleAssignment>,
        owner: address,
    }

    /// Module initializer (runs once on publish)
    fun init(ctx: &mut TxContext) {
        let store = RoleStore {
            id: new(ctx),
            assignments: vector::empty<RoleAssignment>(),
            owner: sender(ctx),
        };
        transfer(store, sender(ctx));
    }

    /// Assign a role to a DID
    public entry fun assign_role(store: &mut RoleStore, did: vector<u8>, role: vector<u8>) {
        let assignment = RoleAssignment { did, role };
        vector::push_back(&mut store.assignments, assignment);
    }

    /// Check if a DID has a role
    public entry fun has_role(store: &RoleStore, did: vector<u8>, role: vector<u8>): bool {
        let assignments = &store.assignments;
        let len = vector::length(assignments);
        let mut i = 0;
        while (i < len) {
            let item = vector::borrow(assignments, i);
            if (item.did == did && item.role == role) {
                return true;
            };
            i = i + 1;
        };
        false
    }
}
