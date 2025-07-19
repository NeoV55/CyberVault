# CyberVault SDK

A full-stack decentralized access control and auditing toolkit for IOTA-based applications. CyberVault SDK enables developers to manage decentralized identities (DIDs), assign roles, enforce access policies, notarize documents, and emit/retrieve on-chain audit events using IOTA Move smart contracts.

---

## 🔧 Features

- DID Registration and Binding
- Role-Based Access Control (RBAC)
- On-chain Access Policy Evaluation
- Document Notarization
- Event Emission and Retrieval
- IOTA Move Smart Contract Integration
- CLI + WASM-ready SDK Architecture

---

## 📁 Folder Structure

```bash
CyberVault/
├── abi/                    # ABI JSON files of smart contracts
├── contracts/              # Move smart contracts (already deployed)
├── scripts/                # Scripts for deployment (Windows .bat)
├── src/
│   ├── identity.rs         # Identity logic
│   ├── rbac.rs             # Role management
│   ├── guard.rs            # Access control
│   ├── notarization.rs     # Notarization logic
│   ├── events.rs           # Event logging
│   ├── policy.rs           # Policy checks
│   ├── lib.rs              # WASM entrypoint (optional)
│   └── main.rs             # CLI entrypoint
├── Cargo.toml
└── deploy_all.bat         # Deploy all contracts
```

---

## 🚀 Installation & Setup

### Prerequisites

- Rust toolchain: [https://rustup.rs/](https://rustup.rs/)
- IOTA CLI: [https://github.com/iotaledger/iota-sdk](https://github.com/iotaledger/iota-sdk) (extract to `C:\iota`)
- Move Compiler: Install via IOTA CLI
- Git

### 1. Clone the Repository

```bash
git clone https://github.com/NeoV55/CyberVault.git
cd CyberVault
```

### 2. Build the SDK

```bash
cargo build
```

---

## 🚧 Deploy Smart Contracts

Contracts are already written in IOTA Move and stored in `contracts/sources`.
Configured move.toml already written for all contracts modules in 'contracts/'
To deploy them to an IOTA testnet:

### 1. Run Batch Deployment Script (Windows)

```bash
deploy_all.bat
```

This deploys:

- `IdentityBinding`
- `RBAC`
- `Guard`
- `Notarization`
- `Events`
- `Policy`

---
### 2. Set Your Package ID and Account

In `contracts/source/*.rs`, update:

```bash
set PACKAGE_ID=0xf829...001f
```


## 🔹 Using the CLI

```bash
cargo run --bin cybervault-cli -- <command> [args...]
```

### Commands:

| Command        | Usage Example                           | Description                    |
| -------------- | --------------------------------------- | ------------------------------ |
| `register`     | `register did:iota:xyz`                 | Register a DID                 |
| `bind`         | `bind did:iota:xyz 0xabc123`            | Bind a DID to a resource       |
| `assign-role`  | `assign-role did:iota:xyz admin`        | Assign role to a DID           |
| `has-role`     | `has-role did:iota:xyz admin`           | Check if a DID has a role      |
| `check-access` | `check-access did:iota:xyz write`       | Verify permission              |
| `notarize`     | `notarize <doc_hash> <timestamp>`       | Notarize a document            |
| `emit-event`   | `emit-event did:iota:xyz login_success` | Emit an audit event            |
| `get-events`   | `get-events did:iota:xyz`               | Retrieve events for a DID      |
| `min-length`   | `min-length secret_key`                 | Check min-length policy        |
| `is-permitted` | `is-permitted did:iota:xyz read`        | Policy-based access evaluation |

---

## 🌐 DApp Integration

CyberVault can be used in:

- WebAssembly (via `lib.rs` bindings)
- Node.js CLI or server wrappers
- Any off-chain Rust app

### WASM Usage Example (via `lib.rs`)

```rust
use cybervault::identity::register;

#[wasm_bindgen]
pub async fn register_did(did: String) {
    let _ = register(&did).await;
}
```

Compile to WASM:

```bash
wasm-pack build --target web
```

---

## 🔮 Technical Details

- **Blockchain**: IOTA Move Layer 1
- **Smart Contract Lang**: Move
- **Rust SDK**: Async, modular, `anyhow`, `clap`, WASM-ready
- **Architecture**:

  - CLI via `main.rs`
  - WASM via `lib.rs`
  - On-chain interaction via IOTA ABI

---

## 🤖 Example Usage Script

Run `test_all_commands.bat` file:

```bat
@echo off
cargo run --bin cybervault-cli -- register did:iota:xyz
cargo run --bin cybervault-cli -- bind did:iota:xyz 0xabc123
cargo run --bin cybervault-cli -- assign-role did:iota:xyz admin
cargo run --bin cybervault-cli -- has-role did:iota:xyz admin
cargo run --bin cybervault-cli -- check-access did:iota:xyz write
cargo run --bin cybervault-cli -- notarize deadbeef123 1721309370
cargo run --bin cybervault-cli -- emit-event did:iota:xyz login
cargo run --bin cybervault-cli -- get-events did:iota:xyz
cargo run --bin cybervault-cli -- min-length password
cargo run --bin cybervault-cli -- is-permitted did:iota:xyz write
```

---

## 🚀 Why CyberVault?

- ✅ Zero-trust, identity-first architecture
- ✅ Complete on-chain access lifecycle
- ✅ Plug-and-play CLI & WASM SDK
- ✅ Secure event logging and auditing
- ✅ Open-source and extensible

---

## 🔗 Contributing

Pull requests welcome! For major changes, please open an issue first.

---

## ✉️ License

MIT License.

---

## ⚙️ Maintainer

**CyberVault**
[NeoV55](https://github.com/NeoV55)
