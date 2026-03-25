# Homepage slot map (`wbez:page --type=home`)

This document maps **stable `data-homepage-slot` values** on generated home pages to the partials/sections that render them. The canonical visual/structural reference is **`guides/app/views/local_roundup_home6s/show.html.erb`** (“homepage6”); the generator template is **`lib/generators/wbez/page/templates/home.html.erb.tt`**.

Use these hooks when swapping modules (e.g. replace the Rise & Chi carousel) without hunting through nested markup.

| `data-homepage-slot` | Region | Renders via |
|----------------------|--------|-------------|
| `hero` | Lead story + 2-column rail | Inline markup in `home.html.erb.tt` |
| `featured-audio` | Featured Audio rail | `shared/ui/bsp_list_loadmore_featured_audio` → `list_carousel` |
| `embed-module` | Yellow donation / embed strip | `shared/ui/embed_module` |
| `politics-breakout` | Politics (or themed) featured breakout | Inline markup in `home.html.erb.tt` |
| `rise-and-chi` | Rise & Chi carousel | `shared/ui/list_carousel` |
| `lower-split` | Row containing main column + right rail | Wrapper `<section>` in `home.html.erb.tt` |
| `more-news` | More News river | Inline markup in `home.html.erb.tt` |
| `lower-right-rail` | Aside column for stacked rail modules | `<aside>` in `home.html.erb.tt` |
| `right-rail.curious-city-one-col` | Curious City one-column promo | Inline `<section>` in `home.html.erb.tt` |
| `right-rail.curious-city-promo` | Curious City Hearken-style form | `shared/ui/curious_city_promo` |
| `right-rail.whats-that-building` | What’s that building? one-column promo | Inline `<section>` in `home.html.erb.tt` |
| `right-rail.one-column-event-list` | Upcoming events list | `shared/ui/one_column_event_list` |
| `right-rail.one-column-top-list` | “In case you missed it” top list | `shared/ui/one_column_top_list` |
| `bottom-full-width-promo` | Member / donate full-width band (outside `<main>`) | `shared/ui/full_width_promo_spot` |

**Also useful:** each pattern may expose **`data-wbez-pattern="..."`** on its root (see `/demo/cookbook`). Prefer `data-homepage-slot` for **page-level composition** and `data-wbez-pattern` for **reusable pattern identity**.

**Heading IDs:** Generated pages use suffixes derived from the generator name (e.g. `wbez-one-column-event-list-heading-my_home`) so multiple home-like pages do not collide.
