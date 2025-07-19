module 0x0::Guard {
    use iota::tx_context::{TxContext, sender};
    use std::vector;

    /// Check if sender is in allowed list
    public fun check_access(allowed: vector<address>, ctx: &mut TxContext): bool {
        let sender_addr = sender(ctx);
        let len = vector::length(&allowed);
        let mut i = 0;
        while (i < len) {
            let addr = vector::borrow(&allowed, i);
            if (addr == sender_addr) {
                return true;
            };
            i = i + 1;
        };
        false
    }
}
