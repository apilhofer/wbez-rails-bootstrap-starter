# frozen_string_literal: true

require_relative "../test_helper"

class AppShellSourceTest < Minitest::Test
  def test_app_shell_install_module_exists
    assert File.exist?(File.join(ROOT, "template/install/app_shell.rb"))
  end

  def test_app_generators_listed_in_support_lib
    source = File.read(File.join(ROOT, "template/install/base.rb"))
    assert_includes source, "lib/generators/wbez/app/app_generator.rb"
    assert_includes source, "lib/generators/suntimes/app/app_generator.rb"
  end

  def test_shared_app_ui_partials_exist
    assert File.exist?(File.join(ROOT, "app/views/shared/ui/app/_story_row.html.erb"))
    assert File.exist?(File.join(ROOT, "app/views/layouts/app.html.erb"))
    assert File.exist?(File.join(ROOT, "public/service-worker.js"))
  end

  def test_version_is_3
    require_relative "../../lib/wbez_bootstrap_starter/version"
    assert_equal "3.0.0", WbezBootstrapStarter::VERSION
  end
end
