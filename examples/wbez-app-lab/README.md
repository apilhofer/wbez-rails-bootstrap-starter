# WBEZ App Lab (reference prototype)

This folder contains **application-specific** code for validating the app-prototype starter with real RSS ingestion. Copy or merge into a generated Rails app — it is not installed by the template automatically.

## Setup

```bash
# From repo root
cd examples/wbez-app-lab
./bin/setup
./bin/dev
```

Or manually:

1. Create a Rails app and install the starter template.
2. Run `bin/rails generate wbez:app news_lab`.
3. Copy `app/models`, `app/jobs`, `app/services`, and `db/migrate` from this folder.
4. `bin/rails db:migrate solid_queue:install solid_queue:start` (or your job backend).
5. Set `WBEZ_APP_LAB_FEED_URL` to a full-text RSS feed.

## Domain model

- `Source` — publisher identity
- `Feed` — RSS endpoint belonging to a source
- `Story` — normalized article record (see brief §7 fields)

## Importer

`FeedImportJob` fetches RSS via `RssStoryImporter` and upserts stories by GUID.

Run manually: `bin/rails runner 'FeedImportJob.perform_now(Feed.first.id)'`

## Experiments

Uses the generated `news_lab` shell with `baseline` and `dense_river` variants. Customize under `app/views/news_labs/experiments/`.
