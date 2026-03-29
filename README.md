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
- `article` (default): long-form article layout (WBEZ uses `.prose-wbez` and `shared/ui/wbez/article_shell`; Sun-Times uses `.prose-suntimes` and `shared/ui/suntimes/article_shell`)
- `home` (or `homepage`): WBEZ uses hero and story-card modules; Sun-Times uses a multi-column homepage with `.suntimes-homepage` on `<main>`, grey `placeholder_rect` partials, and optional `image.webp` for promos until you wire real assets

### Brand separation

WBEZ and Sun-Times use **mirrored partial paths** under `app/views/shared/ui/wbez/` and `app/views/shared/ui/suntimes/` (`site_header`, `site_footer`, `article_shell`, plus Sun-Times `utility_dropdown` / `nav_dropdown`). **Scoped CSS** uses `.wbez-prototype` and `.suntimes-prototype`; Sun-Times homepage layout tokens use `.suntimes-homepage` on the main content shell. **Neutral** editorial modules (e.g. `story_card`, `section_header`) stay at `app/views/shared/ui/` without a brand folder.

### Project layout (views, styles, demos)

| Area | WBEZ | Sun-Times | Neutral |
|------|------|-----------|---------|
| Site chrome | `shared/ui/wbez/site_header`, `site_footer`, `article_shell` | `shared/ui/suntimes/…` | — |
| Homepage modules | `wbez:page` home template | `shared/ui/suntimes/home/*` | — |
| Style guide partials | `shared/ui/wbez/style_guide/*` | `shared/ui/suntimes/style_guide/*` | — |
| Stylesheets | `brands/_wbez.scss` | `brands/_suntimes_tokens.scss`, `_suntimes.scss`, `_suntimes_homepage.scss` | — |
| Demo templates | `app/views/demo/wbez/*` | `app/views/demo/suntimes/*` | `app/views/demo/index`, `_results*` |
| Demo sample data | `DemoWbezSampleData` concern | `DemoSuntimesHomepageSampleData` concern | — |

Decorative Sun-Times SVGs from the homepage reference live under `app/assets/images/suntimes/homepage/`.

### Migrating from older template paths (breaking)

If you customized renders from a pre-restructure install, update paths as follows:

| Old | New |
|-----|-----|
| `shared/ui/site_header_wbez` | `shared/ui/wbez/site_header` |
| `shared/ui/site_footer` (WBEZ) | `shared/ui/wbez/site_footer` |
| `shared/ui/article_shell` (WBEZ) | `shared/ui/wbez/article_shell` |
| `shared/ui/site_header_suntimes` | `shared/ui/suntimes/site_header` |
| `shared/ui/site_footer_suntimes` | `shared/ui/suntimes/site_footer` |
| `shared/ui/article_shell_suntimes` | `shared/ui/suntimes/article_shell` |
| `shared/ui/cst_utility_dropdown` | `shared/ui/suntimes/utility_dropdown` |
| `shared/ui/cst_nav_dropdown` | `shared/ui/suntimes/nav_dropdown` |
| `.suntimes-home--visily` | `.suntimes-homepage` |
| `_suntimes_home_visily.scss` | `_suntimes_homepage.scss` |
| `suntimes-visily/*` images | `suntimes/homepage/*` |
| `.suntimes-footer--visily` | `.suntimes-footer--layout` |

### Sun-Times font policy

Sun-Times tokens are defined in `app/assets/stylesheets/brands/_suntimes_tokens.scss` and loaded by `application.bootstrap.scss`. Headline styling uses Proxima Nova via Adobe Typekit kit `qzq4qkv` (with Helvetica/Arial fallbacks if Typekit is unavailable).

### Models

This template does not ship ActiveRecord models. If you add them, mirror brand boundaries with `app/models/wbez/` and `app/models/suntimes/` (or `Wbez::` / `Suntimes::` namespaces), consistent with `shared/ui/wbez` and `shared/ui/suntimes`.

## Template structure (inside this repo)

- `template/bootstrap_template.rb`: thin entrypoint; orchestrates installs
- `template/install/*`: modular install steps (bootstrap, assets, demos, cursor/docs, routes)
- `lib/wbez_bootstrap_starter/version.rb`: template version constant
- `lib/generators/wbez/page/*`: `wbez:page` generator templates
- `lib/generators/suntimes/page/*`: `suntimes:page` generator templates

## Demo routes (development only)

Demo routes are inserted only inside a `if Rails.env.development?` block. URLs are unchanged; templates live under `app/views/demo/wbez/` and `app/views/demo/suntimes/`:

- `/demo` — overview (`demo/index`)
- `/demo/home`, `/demo/article`, `/demo/cookbook`, `/demo/logos`, `/demo/icons`, `/demo/style-guide-wbez` — WBEZ (`demo/wbez/*`)
- `/demo/cookbook-suntimes`, `/demo/style-guide-suntimes` — Sun-Times (`demo/suntimes/*`)

`DemoController` assigns sample data via `DemoWbezSampleData` and `DemoSuntimesHomepageSampleData` (`app/controllers/concerns/`).

The template does **not** change your app’s root route.

## Ferris icons and logos

- Ferris icons are **local SVGs** under `app/assets/images/icons` and must be rendered with `ferris_icon` (or `inline_svg`), not `image_tag`.
- Logos are downloaded into `app/assets/images/logos` during template install.

## Cursor-native additions

This package includes:
- a stronger `AGENTS.md`
- a Cursor rule file in `.cursor/rules/wbez-bootstrap.mdc`
- a `docs/design-system/cursor-native-guide.md` handoff/reference guide
- a `/demo/cookbook` page for editorial patterns
- dual brand style-guide demos and cookbook demos for WBEZ + Sun-Times
