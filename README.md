# mint-proj

A practice Mintlify documentation site with Auth0 SPA JS SDK reference integration.

## Structure

```
.
├── docs.json              # Site config: theme, colours, navigation
├── index.mdx              # Home page
├── quickstart.mdx         # Quickstart guide
├── test.mdx               # Test page
└── sdk-artifacts/
    ├── auth0-spa-js.json          # TypeDoc output for auth0-spa-js
    └── spa-js-reference.en.json  # Pre-built SDK reference nav
```

## Navigation tabs

- **Guides** - hand-authored MDX pages (`index`, `quickstart`, `test`)
- **SDK Reference** - built from `spa-js-reference.en.json` via `$ref`

## Running locally

```bash
npx mintlify dev
```

Requires Node.js. The dev server hot-reloads on file save.

## Adding pages

1. Create a new `.mdx` file at the root (or in a subdirectory).
2. Add its path (no extension) to the relevant `navigation.groups[].pages` array in `docs.json`.
