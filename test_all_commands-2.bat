@echo off
cargo run --bin cybervault-cli -- register did:iota:abc123
cargo run --bin cybervault-cli -- bind did:iota:abc123 0xresource123
cargo run --bin cybervault-cli -- assign-role did:iota:abc123 admin 0xresource123
cargo run --bin cybervault-cli -- has-role did:iota:abc123 admin 0xresource123
cargo run --bin cybervault-cli -- is-permitted 0xresource123 read
cargo run --bin cybervault-cli -- check-access write
cargo run --bin cybervault-cli -- notarize abcdef1234567890 1721309000
cargo run --bin cybervault-cli -- emit-event did:iota:abc123 login_success 0xresource123
cargo run --bin cybervault-cli -- get-events 0xresource123
cargo run --bin cybervault-cli -- min-length secret 6