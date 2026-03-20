# WBEZ Bootstrap Starter

Fresh install:

```bash
rails new my_app -d postgresql
cd my_app
mkdir -p tmp
cp -R /path/to/wbez_bootstrap_starter_logo_fix tmp/wbez_bootstrap_starter
bin/rails app:template LOCATION=tmp/wbez_bootstrap_starter/template/bootstrap_template.rb
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

Demo pages:
- `/`
- `/demo`
- `/demo/home`
- `/demo/article`
- `/demo/logos`
- `/demo/icons`


## Ferris icons

Ferris icons are installed as local SVG files and rendered with an inline SVG helper so they can inherit CSS color, including white icons on a black header.


Note: demo routes are development-only and do not replace your app root route.


Demo routes are development-only and do not modify your app root route.

## Cursor-native additions

This package includes:
- a stronger `AGENTS.md`
- a Cursor rule file in `.cursor/rules/wbez-bootstrap.mdc`
- a `docs/design-system/cursor-native-guide.md` handoff/reference guide
- a `/demo/cookbook` page for editorial patterns

### Demo routes (development only)
- `/demo`
- `/demo/home`
- `/demo/article`
- `/demo/logos`
- `/demo/icons`
- `/demo/cookbook`

These demo routes do not modify the application root route.
