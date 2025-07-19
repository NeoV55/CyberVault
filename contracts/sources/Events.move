module 0x0::Events {
    use iota::object::{UID, new};
    use iota::tx_context::{TxContext, sender};
    use iota::transfer::transfer;
    use std::vector;

    /// Event resource
    public struct Event has key, store {
        id: UID,
        name: vector<u8>,
        data: vector<u8>,
        timestamp: u64,
    }

    /// Emit a new event
    public entry fun emit_event(name: vector<u8>, data: vector<u8>, timestamp: u64, ctx: &mut TxContext) {
        let event = Event {
            id: new(ctx),
            name,
            data,
            timestamp,
        };
        transfer(event, sender(ctx));
    }

    /// Get event info (requires object reference)
    public fun get_event(event: &Event): (vector<u8>, vector<u8>, u64) {
        (event.name, event.data, event.timestamp)
    }
}
