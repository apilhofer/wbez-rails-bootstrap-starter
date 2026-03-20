# frozen_string_literal: true

say "Installing WBEZ Bootstrap starter..."

gemfile_contents = File.read("Gemfile")
unless gemfile_contents.include?('gem "cssbundling-rails"')
  run "bundle add cssbundling-rails"
end

unless gemfile_contents.include?('gem "nokogiri"')
  run "bundle add nokogiri"
end

run "bin/rails css:install:bootstrap"

starter_root = File.expand_path("..", __dir__)

def install_copy(src_root, rel_path)
  source = File.join(src_root, rel_path)
  destination = rel_path
  FileUtils.mkdir_p(File.dirname(destination))
  if File.directory?(source)
    FileUtils.cp_r(Dir.glob("#{source}/*"), destination)
  else
    FileUtils.cp(source, destination)
  end
end

def download_file(url, destination)
  run %(mkdir -p "#{File.dirname(destination)}")
  run %(curl -fsSL "#{url}" -o "#{destination}")
end

empty_directory ".cursor/rules"
empty_directory "docs/design-system"
empty_directory "app/views/shared/ui"
empty_directory "app/views/demo"
empty_directory "app/assets/images/logos"
empty_directory "app/assets/images/icons/wbez"
empty_directory "app/assets/images/icons/marketing"

install_copy(starter_root, "AGENTS.md")
install_copy(starter_root, ".cursor/rules/wbez-bootstrap.mdc")
install_copy(starter_root, "docs/design-system/bootstrap-wbez.md")
install_copy(starter_root, "app/assets/stylesheets/application.bootstrap.scss")
install_copy(starter_root, "app/helpers/ui_helper.rb")
install_copy(starter_root, "app/controllers/demo_controller.rb")
install_copy(starter_root, "app/views/shared/ui")
install_copy(starter_root, "app/views/demo")
install_copy(starter_root, "app/helpers")
install_copy(starter_root, "app/assets/images/icons")

# Extract Ferris icons from the Ferris docs HTML so we get real standalone SVG files.
begin
  require "open-uri"
  ferris_html = URI.open("https://ferris-ds.wbez.org/").read
  symbols = ferris_html.scan(/<symbol id="([^"]+)"([^>]*)>(.*?)<\/symbol>/m)
  symbols.each do |name, attrs, body|
    next unless attrs =~ /viewBox="([^"]+)"/
    view_box = Regexp.last_match(1)
    group = if %w[cursor envelope external-link facebook feedburner heart instagram jump-back jump-forward link menu microphone news pause pdf play plus rss search skip-back skip-forward stop times twitter youtube].include?(name)
      "wbez"
    else
      "marketing"
    end
    destination = "app/assets/images/icons/#{group}/#{name}.svg"
    FileUtils.mkdir_p(File.dirname(destination))
    File.write(destination, %(<svg xmlns="http://www.w3.org/2000/svg" viewBox="#{view_box}">#{body}</svg>\n))
  end
rescue => e
  say "Ferris icon extraction skipped: #{e.message}"
end


logo_sources = {
  "app/assets/images/logos/cpm-global-header.svg" => "https://cst.brightspotcdn.com/2a/98/f071f53548639088edca14d9a392/cpm-global-header.svg",
  "app/assets/images/logos/cst-global-header.svg" => "https://cst.brightspotcdn.com/d9/fb/5be4f3974c0f810df3518b0761fe/cst-global-header.svg",
  "app/assets/images/logos/wbez-standard-logo.svg" => "https://cst.brightspotcdn.com/76/9a/93bf26c94cf28fc304cadf87cd8e/wbez-logo-white-red.svg",
  "app/assets/images/logos/cpm-logo.png" => "https://ferris-ds.wbez.org/logos/cpm-logo.png",
  "app/assets/images/logos/vocalo-logo-oneline.svg" => "https://ferris-ds.wbez.org/logos/vocalo-logo-oneline.svg",
  "app/assets/images/logos/vocalo-logo-stacked.svg" => "https://ferris-ds.wbez.org/logos/vocalo-logo-stacked.svg",
  "app/assets/images/logos/wbez-915-chicago-logo-oneline--light.svg" => "https://ferris-ds.wbez.org/logos/wbez-915-chicago-logo-oneline--light.svg",
  "app/assets/images/logos/wbez-915-chicago-logo-oneline.svg" => "https://ferris-ds.wbez.org/logos/wbez-915-chicago-logo-oneline.svg",
  "app/assets/images/logos/wbez-915-chicago-logo-stacked.svg" => "https://ferris-ds.wbez.org/logos/wbez-915-chicago-logo-stacked.svg",
  "app/assets/images/logos/wbez-chicago-logo-oneline--dark-theme.svg" => "https://ferris-ds.wbez.org/logos/wbez-chicago-logo-oneline--dark-theme.svg",
  "app/assets/images/logos/wbez-chicago-logo-oneline.svg" => "https://ferris-ds.wbez.org/logos/wbez-chicago-logo-oneline.svg",
  "app/assets/images/logos/wbez-chicago-logo-tagline--dark-theme.svg" => "https://ferris-ds.wbez.org/logos/wbez-chicago-logo-tagline--dark-theme.svg",
  "app/assets/images/logos/wbez-chicago-logo-tagline.svg" => "https://ferris-ds.wbez.org/logos/wbez-chicago-logo-tagline.svg",
  "app/assets/images/logos/wbez-rundown-logo.svg" => "https://ferris-ds.wbez.org/logos/wbez-rundown-logo.svg",
  "app/assets/images/logos/wbez-square.svg" => "https://ferris-ds.wbez.org/logos/wbez-square.svg"
}

logo_sources.each do |destination, url|
  download_file(url, destination)
end


run "npm install --save-dev sass nodemon postcss postcss-cli autoprefixer"
run "npm install bootstrap bootstrap-icons @popperjs/core"

run %(npm pkg set scripts.build:css:compile="sass ./app/assets/stylesheets/application.bootstrap.scss:./app/assets/builds/application.css --no-source-map --load-path=node_modules")
run %(npm pkg set scripts.build:css:prefix="postcss ./app/assets/builds/application.css --use=autoprefixer --output=./app/assets/builds/application.css")
run %(npm pkg set scripts.build:css="npm run build:css:compile && npm run build:css:prefix")
run %q(npm pkg set scripts.watch:css='nodemon --watch ./app/assets/stylesheets/ --ext scss --exec "npm run build:css"')

procfile = "Procfile.dev"
if File.exist?(procfile)
  contents = File.read(procfile)
  web_line = contents.lines.find { |line| line.start_with?("web:") } || "web: env RUBY_DEBUG_OPEN=true bin/rails server\n"
  File.write(procfile, web_line + "css: npm run watch:css\n")
else
  File.write(procfile, "web: env RUBY_DEBUG_OPEN=true bin/rails server\ncss: npm run watch:css\n")
end

route_marker = "# WBEZ_BOOTSTRAP_DEMO_ROUTES"
routes_path = "config/routes.rb"
routes = File.read(routes_path)

unless routes.include?(route_marker)
  development_block = <<~RUBY

    #{route_marker}
    if Rails.env.development?
      get "/demo", to: "demo#index"
      get "/demo/home", to: "demo#home"
      get "/demo/article", to: "demo#article"
      get "/demo/logos", to: "demo#logos"
      get "/demo/icons", to: "demo#icons"
      get "/demo/cookbook", to: "demo#cookbook"
    end
  RUBY

  insert_into_file routes_path, development_block, before: /^end\s*$/
end

updated_routes = File.read(routes_path)
unless updated_routes.include?('root "demo#home"')
  insert_into_file routes_path, %Q(\n  root "demo#home"\n), before: /^\s*# WBEZ_BOOTSTRAP_DEMO_ROUTES/
end

run "npm run build:css"

say "WBEZ Bootstrap starter installed."
say "Downloaded local logo assets into app/assets/images/logos."
say "Run bin/rails db:create db:migrate and ./bin/dev"

say "Installed inline SVG helper for Ferris icons (supports currentColor styling)."
