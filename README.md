# Dainty - Full-Stack Rust Web Application Template

A modern, production-ready template for building full-stack web applications with Rust, HTMX, Alpine.js, and PostgreSQL.

## Features

**Full-Stack Components:**
- ✅ **Backend** - Rust/Axum web server with PostgreSQL, session management, and TLS support
- ✅ **Frontend** - HTMX + Alpine.js + Tailwind CSS 4 + DaisyUI for modern, reactive UIs
- ✅ **E2E Testing** - Playwright tests with automatic server lifecycle management
- ✅ **Build Automation** - Mise task runner for development, testing, and deployment
- ✅ **Deployment** - Docker containerization with multi-stage builds
- ✅ **Development Tooling** - LSP servers, hot-reload, code formatting, and SQL code generation

## Quick Start

### Prerequisites

- [cargo-generate](https://github.com/cargo-generate/cargo-generate) - Template generator
- [mise](https://mise.jdx.dev/) - Development environment manager (will be installed in generated project)
- PostgreSQL database (local or remote)

### Generate a New Project

```bash
cargo generate casualjim/dainty --allow-commands
```

The `--allow-commands` flag enables automatic setup:
- Trusts the mise configuration
- Installs all development tools and dependencies
- Runs `bun install` for frontend dependencies
- Ensures the necessary rustup components get installed

You'll be prompted for:
- **Project name** - Your project name (kebab-case)
- **Project description** - Brief description of your project
- **Database name** - PostgreSQL database name (defaults to project name in snake_case)

### After Generation

1. **Configure your database** - Create a `.env.json` file with your database URLs
2. **Install Playwright browsers** - Run `bunx playwright install`
3. **Create databases** - Set up your PostgreSQL databases
4. **Run migrations** - Apply database migrations with `sqlx migrate run`
5. **Start developing** - Run `mise dev` to start the development server

See the generated project's README for detailed setup instructions.

## What You Get

### Backend Stack
- **Axum** - Fast, ergonomic web framework
- **PostgreSQL** - Robust relational database with TimescaleDB
- **SQLx** - Compile-time checked SQL queries
- **Tower** - Modular service middleware
- **Session Management** - PostgreSQL-backed sessions
- **TLS Support** - Auto-generated certificates for local development

### Frontend Stack
- **HTMX** - Hypermedia-driven interactions
- **Alpine.js** - Lightweight JavaScript framework
- **Tailwind CSS 4** - Utility-first CSS with oxide engine
- **DaisyUI** - Beautiful component library
- **Asset Pipeline** - Optimized bundling and serving

### Development Tools
- **Mise** - Task runner and tool version manager
- **cargo-nextest** - Fast, modern test runner
- **Playwright** - Reliable E2E testing
- **sqlc** - Type-safe SQL code generation
- **Biome** - Fast formatter and linter
- **Docker** - Production-ready containerization

## Template Structure

```
your-project/
├── src/              # Rust source code
│   ├── routes/       # HTTP route handlers
│   ├── pgdb/         # Database models and queries
│   └── ...
├── assets/           # Frontend assets
│   ├── css/          # Tailwind CSS
│   └── js/           # TypeScript/Alpine.js
├── migrations/       # Database migrations
├── queries/          # SQL queries (sqlc)
├── tests/            # E2E tests (Playwright)
├── mise.toml         # Development tasks and tools
└── Dockerfile        # Production container
```

## Customization

The template includes:
- **Placeholders** - Project name, description, database name auto-configured
- **Git initialization** - New repository created automatically
- **Post-generation hooks** - Automatic setup of mise and dependencies

## License

This template is licensed under the MIT License. Generated projects can use any license you choose.

## Contributing

Contributions welcome! Please open an issue or PR on GitHub.
