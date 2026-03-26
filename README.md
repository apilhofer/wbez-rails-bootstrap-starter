# WBEZ Bootstrap Starter (Versioned Rails Template)

## GitHub-native install (recommended)

1. Create your app:
```bash
rails new my_app -d postgresql
cd my_app
```

2. Install the template:
```bash
bin/rails app:template LOCATION=https://raw.githubusercontent.com/apilhofer/wbez-rails-bootstrap-starter/main/template/bootstrap_template.rb

```

3. Boot:
```bash
bin/rails db:create
bin/rails db:migrate
./bin/dev
```

This installer:
- installs Bootstrap with `cssbundling-rails`
- installs required npm packages
- rewrites package scripts to use `npm`
- normalizes `Procfile.dev`
- creates compiled CSS before first boot
- downloads topbar logos from the Brightspot CDN
- downloads the Ferris logo set into `app/assets/images/logos`
- extracts Ferris icon SVGs from the Ferris docs HTML into `app/assets/images/icons`

## Versions and tags

The template writes `config/wbez_bootstrap_starter.yml` during install with the installed version and (when remote-installed) the GitHub raw base URL.

To install a specific version, reference that tag in the URL:
`.../vX.Y.Z/template/bootstrap_template.rb`

## Upgrade path (v1 -> v2)

The v2 template **never** rewires `/` to the demo homepage. If you previously installed the older template and it inserted `root "demo#home"`, the upgrade removes that root override.

Option A (uses the installed marker file):
```bash
bin/rails wbez:upgrade[v1,v2]
```

Option B (run directly via raw URL):
```bash
bin/rails app:template LOCATION=https://raw.githubusercontent.com/USERNAME/REPO/v2.0.0/template/upgrades/v1_to_v2.rb
```

## Generator scaffold

**WBEZ** — generate a named page with WBEZ chrome (header, footer, `.wbez-prototype` wrapper):
```bash
bin/rails generate wbez:page investigative_article --type=article
bin/rails generate wbez:page breaking_news_article --type=article
bin/rails generate wbez:page local_roundup_home --type=home
```

**Chicago Sun-Times** — generate a page with Sun-Times chrome (header, footer, `.suntimes-prototype` wrapper):
```bash
bin/rails generate suntimes:page city_desk_roundup --type=home
bin/rails generate suntimes:page metro_investigation --type=article
```

Each generator creates:
- `app/controllers/<name_plural>_controller.rb`
- `app/views/<name_plural>/show.html.erb`
- a route at `/<name>` that points to `<name_plural>#show`

`--type` supports:
- `article` (default): long-form article layout (WBEZ uses `.prose-wbez`; Sun-Times uses `.prose-suntimes` and `article_shell_suntimes`)
- `home` (or `homepage`): WBEZ uses hero and story-card modules; Sun-Times uses a Visily-derived multi-column homepage (`suntimes-home--visily`) with placeholder images from `image.webp` until you wire real assets

### Brand separation

WBEZ and Sun-Times mockups use **different partials** (`site_header_wbez` vs `site_header_suntimes`, matching footers and article shells) and **scoped CSS** under `.wbez-prototype` and `.suntimes-prototype` so tokens and overrides do not leak between brands. The legacy partial `shared/ui/site_header` still renders the WBEZ header for backward compatibility.

## Template structure (inside this repo)

- `template/bootstrap_template.rb`: thin entrypoint; orchestrates installs
- `template/install/*`: modular install steps (bootstrap, assets, demos, cursor/docs, routes)
- `template/upgrades/*`: upgrade scripts (currently `v1_to_v2.rb`)
- `lib/wbez_bootstrap_starter/version.rb`: template version constant
- `lib/generators/wbez/page/*`: `wbez:page` generator templates
- `lib/generators/suntimes/page/*`: `suntimes:page` generator templates
- `lib/tasks/wbez_bootstrap_starter.rake`: `wbez:upgrade[from,to]` task for generated apps

## Demo routes (development only)

Demo routes are inserted only inside a `if Rails.env.development?` block:
- `/demo`
- `/demo/home`
- `/demo/article`
- `/demo/logos`
- `/demo/icons`
- `/demo/cookbook`

In v2, the template does **not** change your app’s root route.

## Ferris icons and logos

- Ferris icons are **local SVGs** under `app/assets/images/icons` and must be rendered with `ferris_icon` (or `inline_svg`), not `image_tag`.
- Logos are downloaded into `app/assets/images/logos` during template install.

## Cursor-native additions

This package includes:
- a stronger `AGENTS.md`
- a Cursor rule file in `.cursor/rules/wbez-bootstrap.mdc`
- a `docs/design-system/cursor-native-guide.md` handoff/reference guide
- a `/demo/cookbook` page for editorial patterns
