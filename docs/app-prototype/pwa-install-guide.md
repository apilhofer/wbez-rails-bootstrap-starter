# Install the app prototype on iPhone

1. Deploy the Rails app to **HTTPS** (required for service workers and install).
2. Open the prototype URL in **Safari** (e.g. `/demo/app-wbez` or your generated `/news_lab` route).
3. Tap **Share** → **Add to Home Screen**.
4. Launch from the home screen icon — the app should open in standalone mode with minimal browser chrome.

## Tips

- Use Safari, not Chrome, for the most reliable iOS install flow during internal testing.
- After deploy, testers may need to close and reopen the installed icon to pick up service worker updates.
- If install is unavailable, confirm the site is served over HTTPS and `/manifest.webmanifest` loads successfully.
