module 0x0::Policy {
    use std::vector;

    /// Check minimum length
    public fun min_length(data: vector<u8>, min: u64): bool {
        vector::length(&data) >= min
    }

    /// Check if value matches any in required list
    public fun matches_any(value: vector<u8>, required: &vector<vector<u8>>): bool {
        let len = vector::length(required);
        let mut i = 0;
        while (i < len) {
            let item = vector::borrow(required, i);
            if (item == value) {
                return true;
            };
            i = i + 1;
        };
        false 
    }

    /// Check if subject is permitted
    public fun is_permitted(policy: vector<address>, subject: address): bool {
        let len = vector::length(&policy);
        let mut i = 0;
        while (i < len) {
            let addr = vector::borrow(&policy, i);
            if (addr == subject) {
                return true;
            };
            i = i + 1;
        };
        false
    }
}
