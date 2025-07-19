use std::env;
use tokio;

use cybervault::{
    identity::{register, bind},
    rbac::{assign_role, has_role},
    guard::check_access,
    notarization::notarize,
    events::{emit_event, get_events},
    policy::{is_permitted, min_length},
};

#[tokio::main]
async fn main() {
    let args: Vec<String> = env::args().collect();

    if args.len() < 2 || args[1] == "--help" || args[1] == "-h" {
        print_help();
        return;
    }

    let command = &args[1];

    match command.as_str() {
        "register" => {
            if args.len() != 3 {
                eprintln!("Usage: register <did>");
                return;
            }
            let did = &args[2];
            let result = register(did).await;
            println!("{:?}", result);
        }

        "bind" => {
            if args.len() != 4 {
                eprintln!("Usage: bind <identity> <resource>");
                return;
            }
            let identity = &args[2];
            let resource = &args[3];
            let result = bind(identity, resource).await;
            println!("{:?}", result);
        }

        "assign-role" => {
            if args.len() != 4 {
                eprintln!("Usage: assign-role <identity> <role>");
                return;
            }
            let identity = &args[2];
            let role = &args[3];
            let result = assign_role(identity, role).await;
            println!("{:?}", result);
        }

        "has-role" => {
            if args.len() != 4 {
                eprintln!("Usage: has-role <identity> <role>");
                return;
            }
            let identity = &args[2];
            let role = &args[3];
            let result = has_role(identity, role).await;
            println!("{:?}", result);
        }

        "check-access" => {
            if args.len() != 4 {
                eprintln!("Usage: check-access <identity> <action>");
                return;
            }
            let identity = &args[2];
            let action = &args[3];
            let result = check_access(identity, action).await;
            println!("{:?}", result);
        }

        "notarize" => {
            if args.len() != 4 {
                eprintln!("Usage: notarize <doc_hash> <timestamp>");
                return;
            }
            let hash = &args[2];
            let timestamp = &args[3];
            let result = notarize(hash, timestamp).await;
            println!("{:?}", result);
        }

        "emit-event" => {
            if args.len() != 4 {
                eprintln!("Usage: emit-event <identity> <event>");
                return;
            }
            let identity = &args[2];
            let event = &args[3];
            let result = emit_event(identity, event).await;
            println!("{:?}", result);
        }

        "get-events" => {
            if args.len() != 3 {
                eprintln!("Usage: get-events <identity>");
                return;
            }
            let identity = &args[2];
            let result = get_events(identity).await;
            println!("{:?}", result);
        }

        "min-length" => {
            if args.len() != 3 {
                eprintln!("Usage: min-length <resource>");
                return;
            }
            let resource = &args[2];
            let result = min_length(resource).await;
            println!("{:?}", result);
        }

        "is-permitted" => {
            if args.len() != 4 {
                eprintln!("Usage: is-permitted <identity> <action>");
                return;
            }
            let identity = &args[2];
            let action = &args[3];
            let result = is_permitted(identity, action).await;
            println!("{:?}", result);
        }

        _ => {
            eprintln!("Unknown command: {}", command);
        }
    }
}

fn print_help() {
            println!("CyberVault CLI - Available Commands:");
            println!("  register <did>                      Register a new identity");
            println!("  bind <identity> <resource>         Bind identity to resource");
            println!("  assign-role <identity> <role>      Assign a role to identity");
            println!("  has-role <identity> <role>         Check if identity has a role");
            println!("  check-access <identity> <action>   Check access permission for action");
            println!("  notarize <doc_hash> <timestamp>    Notarize document with hash and timestamp");
            println!("  emit-event <identity> <event>      Emit an event for identity");
            println!("  get-events <identity>              Fetch all events for identity");
            println!("  min-length <resource>              Validate minimum length policy on resource");
            println!("  is-permitted <identity> <action>   Check if identity is permitted for action");
            println!("  --help, -h                         Show this help message");
        }