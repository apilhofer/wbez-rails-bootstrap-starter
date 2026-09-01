# Deploying app prototypes

App prototypes are ordinary Rails apps. For internal testing:

1. Deploy to any HTTPS host (Kamal, Fly.io, Render, etc.).
2. Ensure `RAILS_ENV=production` precompiles assets (`npm run build:css` / `assets:precompile` as configured).
3. Share the HTTPS URL with testers.
4. Point them to [pwa-install-guide.md](pwa-install-guide.md).

## Environment variables (app-lab example)

| Variable | Purpose |
|----------|---------|
| `WBEZ_APP_LAB_FEED_URL` | RSS feed URL for the reference app-lab importer |

Feed-specific configuration belongs in the **prototype app**, not the starter template.
