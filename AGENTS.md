# AGENTS.md

This is a Rails 8 application using Hotwire/Turbo, Stimulus, and Bootstrap.

## Core UI policy
- Always prefer Rails-native patterns.
- Use ERB partials, helpers, and Stimulus before custom JavaScript frameworks.
- Preserve Turbo/Hotwire behavior by default.
- Do not add React, Vue, or client-side component frameworks unless explicitly requested.

## Design system policy
- Always implement UI using WBEZ-inspired editorial patterns.
- Prefer Bootstrap components and layout utilities before custom CSS.
- Apply WBEZ branding through shared partials and theme variables.
- Do not invent ad hoc colors, spacing systems, or type stacks unless explicitly asked.

## Typography
- Use Source Sans Pro for UI, forms, nav, metadata, labels, and utility text.
- Use Charter for editorial headlines, pull quotes, and article subheads.
- Keep dense app UI sans-serif.

## Bootstrap policy
- Prefer Bootstrap for navbar, offcanvas, cards, alerts, badges, forms, nav-tabs, pagination, grid, and buttons.
- Reuse shared partials in `app/views/shared/ui`.
- When a new pattern is needed, extract a reusable partial.

## Editorial content
- Use `.prose-wbez` for long-form content.
- Use serif headings for editorial content.
- Prefer pull quotes, captions, section breaks, and article structure for storytelling.
- Avoid dropping generic cards/buttons into article bodies unless intentional.

## Hotwire/Turbo rules
- Do not replace links/forms with custom JavaScript when Rails + Turbo handles the behavior.
- Keep forms, links, flash messages, and navigation compatible with Turbo.
- Use Turbo Frames for scoped updates.
- Use Stimulus only for light progressive enhancement.

## Shared UI inventory
Prefer these shared partials before writing inline Bootstrap markup:

- shared/ui/site_header
- shared/ui/site_footer
- shared/ui/section_header
- shared/ui/story_card
- shared/ui/hero_story
- shared/ui/alert
- shared/ui/badge
- shared/ui/button
- shared/ui/card
- shared/ui/field
- shared/ui/tabs
- shared/ui/pagination
- shared/ui/pull_quote
- shared/ui/figure
- shared/ui/responsive_embed
- shared/ui/article_shell
- shared/ui/article_header

## Brand assets
- Download and use local logo assets from the installer.
- Use the logos demo page at `/demo/logos` to inspect available brand files.
