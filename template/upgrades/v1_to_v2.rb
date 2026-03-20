# frozen_string_literal: true

say "Running WBEZ Bootstrap starter upgrade: v1 -> v2"

routes_path = "config/routes.rb"
routes = File.read(routes_path)
original_routes = routes.dup

route_marker = "# WBEZ_BOOTSTRAP_DEMO_ROUTES"

root_demo_patterns = [
  /^[ \t]*root\s+to:\s*["']demo#home["']\s*\r?\n/,
  /^[ \t]*root\s+["']demo#home["']\s*\r?\n/
]

root_demo_patterns.each do |pattern|
  routes.gsub!(pattern, "")
end

# Ensure demo routes exist and remain development-only.
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
  routes = File.read(routes_path)
end

if routes != original_routes
  File.write(routes_path, routes)
end

# Update marker version if present.
marker_path = "config/wbez_bootstrap_starter.yml"
if File.exist?(marker_path)
  require "yaml"
  marker = YAML.load_file(marker_path) || {}
  marker["installed_version"] = "2.0.0"
  marker["upgraded_to"] = "2.0.0"
  File.write(marker_path, marker.to_yaml)
end

say "Upgrade complete."

