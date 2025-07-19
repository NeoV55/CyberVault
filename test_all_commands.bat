@echo off
cargo run --bin cybervault-cli -- register did:iota:xyz
cargo run --bin cybervault-cli -- bind did:iota:xyz 0xabc123
cargo run --bin cybervault-cli -- assign-role did:iota:xyz admin
cargo run --bin cybervault-cli -- has-role did:iota:xyz admin
cargo run --bin cybervault-cli -- check-access did:iota:xyz write
cargo run --bin cybervault-cli -- notarize b9f3e1e31a4c 1721309370
cargo run --bin cybervault-cli -- emit-event did:iota:xyz login_success
cargo run --bin cybervault-cli -- get-events did:iota:xyz
cargo run --bin cybervault-cli -- min-length "secret"
cargo run --bin cybervault-cli -- is-permitted did:iota:xyz read