# dainty

## Setup

```bash
mise install
bun install
```

## Run

```bash
mise dev
```

## Tests

This repository includes Playwright E2E tests under `tests/`.

Install dependencies (uses `mise` to ensure correct toolchain):

```bash
mise install
bun install
``` 

Install Playwright browsers, then run tests:

```bash
playwright install
mise test:e2e
```

If you want Playwright to build and run the server via `cargo`, the `playwright.config.ts` will start the server on port `3001` during tests.

## Troubleshooting

If the lsp server doesn't want to start, it's likely that the rust-anaylyzer component hasn't been installed.

```sh
rustup component add llvm-tools rust-analyzer
```

