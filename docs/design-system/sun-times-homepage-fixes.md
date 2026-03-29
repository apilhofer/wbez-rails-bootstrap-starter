# Sun-Times homepage + header fixes log

| Issue | Root cause | Fix | Files | Ported |
|-------|------------|-----|-------|--------|
| Placeholder images | `@placeholder_image` webp used everywhere | Grey `div` partial matching aspect/size classes | `suntimes/_placeholder_rect`, home partials, `_suntimes_homepage.scss` | |
| Headline / byline colors | Mixed `#000` / body token | Headlines `#2a2a2a`, bylines/meta `#1a1a1a` in `.suntimes-homepage` scope | `_suntimes_homepage.scss`, `_suntimes_tokens.scss` | |
| Hero sub-stories layout | `col-md-6` side-by-side | `col-12` stacked | `suntimes/home/_hero.html.erb` | |
| Latest rail rules | `.suntimes-home__divider` border-bottom | Rail-specific border-top pattern | `_hero.html.erb`, `_suntimes_homepage.scss` | |
| Masthead logo | CST SVG | `ctimes-logo.svg` | `suntimes/_site_header.html.erb` | |
| Header vs content width | `content-shell` 1080px | Header shell `max-width: 1392px`; main content `1110px` | `_suntimes.scss`, `suntimes/_site_header.html.erb`, `main` class | |
| Utility bar wrap | Bootstrap `row` / `col-12` stacking | Single flex row, nowrap at `lg+` | `suntimes/_site_header.html.erb`, `_suntimes.scss` | |
| Hero lead top gap | Bootstrap `.row > *` `margin-top` from `--bs-gutter-y` | No `gy-*` on hero row; optional `!important` zero margin | `_hero.html.erb`, `_suntimes_homepage.scss` | |
