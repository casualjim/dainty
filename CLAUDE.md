# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Dainty is a Rust web server built with Axum, currently in early development (v0.1.0). It's designed as a web service with observability, PostgreSQL with vector embeddings, and integrations for multiple LLM providers.

**⚠️ Security Note**: The `.env` file contains live API keys. These should never be committed to version control. The keys may need rotation if this repo becomes public.

## Commands

### Build and Run
```bash
# Build the project
cargo build

# Run the project
cargo run

# Build for release
cargo build --release

# Run tests
cargo test

# Run a specific test
cargo test test_name
```

### Code Quality
```bash
# Format code according to rustfmt.toml
cargo fmt

# Check code without building
cargo check

# Run clippy linter (if adding clippy to the project)
cargo clippy
```

### Database
```bash
# Generate Rust code from SQL queries (requires sqlc)
sqlc generate -f sqlc.json

# Note: The migrations directory is referenced in sqlc.json for query plans
```

## Architecture

### Entry Points
- **`src/main.rs`**: Binary entry point - currently starts the async runtime and calls `server::run()`
- **`src/lib.rs`**: Library root - declares the `server` module
- **`src/server.rs`**: Contains the `async fn run(cfg: Config, shutdown: CancellationToken)` function where the server implementation should be

### Configuration
- **`.env`**: Environment variables file (contains sensitive API keys and configuration)

- **`sqlc.json`**: SQL code generation configuration for PostgreSQL with vector support
  - Uses `pgvector` for embeddings
  - Deadpool for connection pooling
  - Jiff for date/time handling
  - Writes generated code to `src/db`

- **`Cargo.toml`**: Dependencies focused on:
  - Axum web framework with full features (websockets, multipart, HTTP/2)
  - Observability (tracing, OpenTelemetry, metrics, security headers)
  - TLS support
  - Bootstrap crate from private forgejo registry

### Key Dependencies
- `bootstrap` v0.1.7 from forgejo registry provides common configuration and setup logic
- The project relies heavily on the `bootstrap` crate for configuration handling

## Development Notes

### Current State
The project is a scaffold with minimal implementation:
- `main.rs` is a temporary "Hello, world!" placeholder
- `server.rs` contains a stub `run()` function that needs full implementation
- No actual routing, handlers, or business logic implemented yet

### Build Configuration
- **Test profile**: Optimized for speed (debug=0, stripped=true) to run tests faster
- **rustfmt**: 100 character limit, 2-space tabs
- **Edition**: 2024 (uses latest Rust edition)

### Claude Code Integration
The project includes:
- `.mcp.json`: Configuration for MCP servers (rust-lsp for Rust completion)
- `.claude/settings.local.json`: Claude Code IDE settings
- Claude Code support is built-in

## Database Schema

According to `sqlc.json`, the project expects:
- PostgreSQL database connection
- Vector embeddings support via `pgvector` extension
- Migration files in the `migrations` directory
- Generated code will be placed in `src/db`

The embed queries will have `Vec<f32>` return types, indicating vector similarity search functionality.
