# App prototype reference

This starter includes **mobile app prototyping infrastructure** for WBEZ and Chicago Sun-Times product experiments.

## Quick start

```bash
rails new my_app -d postgresql
cd my_app
bin/rails app:template LOCATION=<starter template URL>
bin/rails generate wbez:app news_lab
./bin/dev
```

Open `/news_lab` on a phone, or try the built-in demos:

- `/demo/app-wbez`
- `/demo/app-suntimes`

## Architecture

| Layer | Location |
|-------|----------|
| Neutral app UI | `app/views/shared/ui/app/` |
| WBEZ app chrome | `app/views/shared/ui/wbez/app/` |
| Sun-Times app chrome | `app/views/shared/ui/suntimes/app/` |
| Mobile layout | `app/views/layouts/app.html.erb` |
| App SCSS scope | `.wbez-app-prototype`, `.suntimes-app-prototype` |
| Experiments | `app/views/<app>/experiments/<variant>/` |
| PWA | `public/service-worker.js`, `/manifest.webmanifest` |

## Experiments

Each generated app includes `baseline` and `dense_river` experiments. Add a new folder under `experiments/` and register it in `config/app_prototype.yml`.

**Cursor prompt example:**

> Create a new experiment called `audio_first` based on baseline. Do not modify baseline.

## Starter vs prototype app

Keep **feed URLs, credentials, and product IA** in your generated app or `examples/wbez-app-lab` — not in `shared/ui/app`.

See also: [PWA install guide](pwa-install-guide.md), [Deploy guide](deploy.md).
