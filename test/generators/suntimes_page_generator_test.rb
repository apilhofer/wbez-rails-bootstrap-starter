# frozen_string_literal: true

require_relative "../test_helper"

class SuntimesPageGeneratorTest < Minitest::Test
  def test_article_generator_outputs
    skip "Set RUN_INTEGRATION=1 to run slow integration tests" unless ENV["RUN_INTEGRATION"] == "1"

    GeneratorAppBuilder.with_rails_app(name: "suntimes_page_article") do |dir|
      GeneratorAppBuilder.run_generator!(dir, "bin/rails generate suntimes:page metro_investigation --type=article")

      assert File.exist?(File.join(dir, "app/controllers/metro_investigations_controller.rb"))
      assert_includes File.read(File.join(dir, "app/views/metro_investigations/show.html.erb")), "suntimes-prototype"
    end
  end
end
