# frozen_string_literal: true

require_relative "../test_helper"

class TemplateInstallTest < Minitest::Test
  def test_template_install_copies_core_files
    skip "Set RUN_INTEGRATION=1 to run slow integration tests" unless ENV["RUN_INTEGRATION"] == "1"

    GeneratorAppBuilder.with_rails_app(name: "install_smoke") do |dir|
      assert File.exist?(File.join(dir, "config/wbez_bootstrap_starter.yml"))
      assert File.exist?(File.join(dir, "app/views/shared/ui/wbez/_site_header.html.erb"))
      assert File.exist?(File.join(dir, "app/views/shared/ui/suntimes/_site_header.html.erb"))
      assert File.exist?(File.join(dir, "app/assets/stylesheets/brands/_wbez.scss"))
      assert File.exist?(File.join(dir, "app/views/layouts/app.html.erb"))
      assert File.exist?(File.join(dir, "app/views/shared/ui/app/_story_row.html.erb"))
      assert File.exist?(File.join(dir, "config/app_prototype.yml"))
      assert File.exist?(File.join(dir, "public/service-worker.js"))
      assert_includes GeneratorAppBuilder.read_routes(dir), "WBEZ_BOOTSTRAP_DEMO_ROUTES"
      assert_includes GeneratorAppBuilder.read_routes(dir), 'get "/demo/home"'
      assert_includes GeneratorAppBuilder.read_routes(dir), 'get "/demo/app-wbez"'
      assert_includes GeneratorAppBuilder.read_routes(dir), 'get "/demo/app-suntimes"'
    end
  end
end
