# Compare a fresh app’s homepage to homepage6

Repeatable check that a **new Rails app** from this template, after `rails g wbez:page … --type=home`, matches the **homepage6** structure (ordering, major regions, swap hooks).

**Reference:** `guides/app/views/local_roundup_home6s/show.html.erb` (external guide app).  
**Slot map:** `docs/homepage-slots.md`.

## 1. Generate a throwaway app

From the template root (or your packaged template URL):

```bash
# Example: install from a local checkout of this template (adjust the path)
rails new tmp_home_compare -m /path/to/wbez-rails-bootstrap-starter/template/bootstrap_template.rb
cd tmp_home_compare
bin/rails g wbez:page local_roundup_home6 --type=home
```

Add a route if needed so `/local_roundup_home6` resolves (the generator adds `get "/local_roundup_home6", …`).

## 2. Structural compare (DOM)

1. Start the server: `bin/rails server`
2. Save HTML: `curl -s http://localhost:3000/local_roundup_home6 > /tmp/generated-home.html`
3. Extract **slot markers** (generated app):

   ```bash
   grep -o 'data-homepage-slot="[^"]*"' /tmp/generated-home.html | sort -u
   ```

4. Expect **at least** these slot names (see `docs/homepage-slots.md`):

   - `hero`, `featured-audio`, `embed-module`, `politics-breakout`, `rise-and-chi`
   - `lower-split`, `more-news`, `lower-right-rail`
   - `right-rail.curious-city-one-col`, `right-rail.curious-city-promo`, `right-rail.whats-that-building`
   - `right-rail.one-column-event-list`, `right-rail.one-column-top-list`
   - `bottom-full-width-promo`

5. Optional: compare **module order** by grepping section/partial markers in both the guide view source and `/tmp/generated-home.html` (hero → featured audio → embed → politics → Rise & Chi → lower split → full-width promo outside `<main>`).

## 3. Visual spot-check

Open the generated URL in a browser and confirm:

- Lead hero + right rail, Featured Audio, yellow embed, Politics breakout, Rise & Chi carousel, More News + right rail stack, full-width promo above footer.

## 4. Helper script

`bin/wbez-compare-homepage` in this repo prints the sorted unique `data-homepage-slot` values from an HTML file (e.g. saved `curl` output):

```bash
bin/wbez-compare-homepage /tmp/generated-home.html
```
