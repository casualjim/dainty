# Template Customization Guide

This document provides guidance on customizing your project after generating it from the dainty template.

## Post-Generation Checklist

After running `cargo generate casualjim/dainty --allow-commands`, follow these steps:

> **Note:** The `--allow-commands` flag allows the template to automatically run `mise trust` and `mise install` after generation, setting up your development environment immediately.

### 1. Configure Your Database

Create a `.env.json` file in your project root:

```bash
cp .env.json.example .env.json
```

Then edit `.env.json` to match your PostgreSQL setup:

```json
{
  "DATABASE_URL": "postgresql://user:password@localhost:5432/your_database",
  "TEST_DATABASE_URL": "postgresql://user:password@localhost:5432/your_database_test"
}
```

### 2. Install Dependencies

Run mise to install all required tools and dependencies:

```bash
mise install
```

This will:
- Install Rust toolchain and components
- Install Node.js and Bun
- Install all development tools (sqlc, cargo-nextest, etc.)
- Run `bun install` automatically via postinstall hook

### 3. Install Playwright Browsers

For E2E testing:

```bash
bunx playwright install
```

### 4. Create Databases

Create your PostgreSQL databases:

```bash
createdb your_database
createdb your_database_test
```

Or using psql:

```sql
CREATE DATABASE your_database;
CREATE DATABASE your_database_test;
```

### 5. Run Migrations

Apply database migrations:

```bash
sqlx migrate run
```

### 6. Start Development Server

Launch the development server:

```bash
mise dev
```

The server will be available at `https://localhost:8080` (TLS certificates are auto-generated on first run).

## Template Placeholders

The template uses the following placeholders that were replaced during generation:

- `{{project-name}}` - Your project name (kebab-case)
- `{{crate_name}}` - Rust crate name (snake_case, auto-derived)
- `{{authors}}` - Author information (from git config)
- `{{project_description}}` - Project description
- `{{database_name}}` - PostgreSQL database name (defaults to project name in snake_case)

## Environment Variables

Your project uses environment variables with the prefix based on your project name:

- `{PROJECT_NAME}_HTTP_PORT` - HTTP server port (default: 8080)
- `{PROJECT_NAME}_HTTPS_PORT` - HTTPS server port (default: 8443)
- `{PROJECT_NAME}_MONITORING_PORT` - Monitoring port (default: 9090)
- `{PROJECT_NAME}_TLS_ENABLED` - Enable/disable TLS (default: false)

Replace `{PROJECT_NAME}` with your project name in SHOUTY_SNAKE_CASE.

## Customization Tips

### Change Server Ports

Edit your `.env.json` or set environment variables:

```bash
export YOUR_PROJECT_HTTP_PORT=3000
export YOUR_PROJECT_HTTPS_PORT=3443
```

### Modify Frontend Styles

- Edit `assets/css/main.css` for Tailwind styles
- Modify `assets/js/main.ts` for TypeScript code
- DaisyUI themes can be configured in the HTML templates

### Add Database Queries

1. Write SQL queries in `queries/` directory
2. Run `mise generate:sql` to generate Rust code
3. Use generated code from `src/pgdb/queries.rs`

### Add Routes

Add new routes in:
- `src/routes/pages.rs` - Full page routes
- `src/routes/components.rs` - HTMX component routes

### Customize Docker Image

Edit `Dockerfile.liquid` (now `Dockerfile` in your project) to:
- Change base image
- Add additional runtime dependencies
- Modify exposed ports

## Available Commands

All development tasks are managed through `mise`:

```bash
mise dev              # Start development server
mise build            # Production build
mise build:debug      # Debug build
mise build:dist       # Create distribution package
mise build:docker     # Build Docker image
mise test             # Run all tests
mise test:rust        # Run Rust unit tests
mise test:e2e         # Run Playwright E2E tests
mise format           # Format all code
mise generate:sql     # Generate code from SQL queries
```

## Troubleshooting

### Mise Install Errors

If you encounter GitHub API rate limits:

```bash
export MISE_GITHUB_TOKEN=$(gh auth token)
mise install
```

### Database Connection Issues

Verify PostgreSQL is running and your `DATABASE_URL` is correct:

```bash
psql $DATABASE_URL -c "SELECT 1"
```

### TLS Certificate Issues

Delete certificates and restart the dev server:

```bash
rm -rf .config/certs
mise dev
```

### Build Errors

Ensure all dependencies are installed:

```bash
mise install
mise clean
mise test
```

## Next Steps

- Read the main [README.md](README.md) for detailed documentation
- Review [AGENTS.md](AGENTS.md) for AI agent coding guidelines
- Check out the example layout persistence implementation in `src/routes/`
- Explore the Playwright E2E tests in `tests/`

## Support

For issues specific to the template, please file an issue at:
https://github.com/casualjim/dainty/issues

For general Rust, Axum, or HTMX questions, consult their respective documentation.
