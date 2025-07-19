@echo off
cargo run --bin cybervault-cli -- register did:iota:xyz
cargo run --bin cybervault-cli -- bind did:iota:xyz 0xabc123
cargo run --bin cybervault-cli -- notarize deadbeef123 1721309370
