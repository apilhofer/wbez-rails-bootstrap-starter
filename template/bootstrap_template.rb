# frozen_string_literal: true

require "open-uri"

say "Installing WBEZ Bootstrap starter..."

location = ENV["LOCATION"].to_s
remote_base_url = if location.start_with?("http")
  location.sub(%r{/template/bootstrap_template\.rb\z}, "").sub(%r{/+\z}, "")
end

module_files = [
  # [remote_relative_path, local_require_relative_path]
  ["lib/wbez_bootstrap_starter/version.rb", "../lib/wbez_bootstrap_starter/version"],
  ["template/install/base.rb", "install/base"],
  ["template/install/bootstrap.rb", "install/bootstrap"],
  ["template/install/assets.rb", "install/assets"],
  ["template/install/helpers.rb", "install/helpers"],
  ["template/install/editorial.rb", "install/editorial"],
  ["template/install/demos.rb", "install/demos"],
  ["template/install/cursor.rb", "install/cursor"],
  ["template/install/docs.rb", "install/docs"],
  ["template/install/routes.rb", "install/routes"]
]

module_files.each do |remote_rel, local_require_rel|
  if remote_base_url
    url = "#{remote_base_url}/#{remote_rel}"
    src = URI.open(url).read
    eval(src, binding, remote_rel)
  else
    require_relative local_require_rel
  end
end

base = WbezBootstrapStarter::Install::Base.new(self, location: location)

base.copy_support_lib

WbezBootstrapStarter::Install::Bootstrap.new(base).install
WbezBootstrapStarter::Install::Cursor.new(base).install
WbezBootstrapStarter::Install::Docs.new(base).install
WbezBootstrapStarter::Install::Helpers.new(base).install
WbezBootstrapStarter::Install::Editorial.new(base).install
WbezBootstrapStarter::Install::Demos.new(base).install
WbezBootstrapStarter::Install::Assets.new(base).install
WbezBootstrapStarter::Install::Routes.new(base).install

base.write_marker_file(installed_version: WbezBootstrapStarter::VERSION)

say "WBEZ Bootstrap starter installed."
say "Downloaded local logo assets into app/assets/images/logos."
say "Run bin/rails db:create db:migrate and ./bin/dev"
say "Installed local Ferris SVG icon assets (currentColor-friendly rendering)."
