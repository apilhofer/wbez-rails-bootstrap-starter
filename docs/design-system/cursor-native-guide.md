# Cursor-native guide

This starter is designed so an LLM can infer the intended UI system from the repo itself.

## Mental model

Think of the project as:

**Bootstrap layout + Rails partials + WBEZ editorial patterns + local brand assets**

The model should not invent a new design language. It should extend the one already present in the repo.

## Build order for new UI

1. Find an existing demo page that looks similar.
2. Reuse shared partials from `app/views/shared/ui`.
3. Use Bootstrap grid, spacing, nav, forms, tables, alerts, and buttons.
4. Apply editorial hierarchy and typography.
5. Use local icons/logos through helpers.
6. Extract a partial when a pattern becomes reusable.

## Use these references

- `app/views/demo/home.html.erb`
- `app/views/demo/article.html.erb`
- `app/views/demo/cookbook.html.erb`
- `app/views/demo/cookbook_suntimes.html.erb`
- `app/views/demo/style_guide_wbez.html.erb`
- `app/views/demo/style_guide_suntimes.html.erb`
- `app/views/demo/icons.html.erb`
- `app/views/demo/logos.html.erb`

## Dual-brand rules

- WBEZ and Sun-Times are separate systems. Keep each under its own wrapper (`.wbez-prototype` vs `.suntimes-prototype`).
- Sun-Times headline typography uses Proxima Nova (Typekit kit `qzq4qkv`) with fallback stacks in `brands/_suntimes_tokens.scss`.
- New tokens/components should be added to both the relevant style-guide page and cookbook page before considered complete.

## Do this / not that

### Icons
Do:
```erb
<%= ferris_icon "search", classes: "text-white", size: 20 %>
```

Do not:
```erb
<%= image_tag "icons/wbez/search.svg" %>
```

### Reuse
Do:
```erb
<%= render "shared/ui/section_header", title: "Top stories" %>
```

Do not build a new section heading treatment every time.

### Articles
Do:
- kicker
- headline
- dek
- metadata
- body in `.prose-wbez`
- pull quotes / figures / embeds where relevant

Do not:
- drop generic product cards into the middle of article copy without a good reason.

### Routing
Do:
- keep demos development-only

Do not:
- override the app's root route

## Best targets for extraction
If the model creates one of these more than once, it should become a shared partial:
- feature card
- story teaser list
- article meta block
- newsletter CTA
- related stories module
- audio/listen card
