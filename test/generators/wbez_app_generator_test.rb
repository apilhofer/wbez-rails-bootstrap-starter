# frozen_string_literal: true

require_relative "../test_helper"

class WbezAppGeneratorTest < Minitest::Test
  def test_generator_creates_app_scaffold
    skip "Set RUN_INTEGRATION=1 to run slow integration tests" unless ENV["RUN_INTEGRATION"] == "1"

    GeneratorAppBuilder.with_rails_app(name: "wbez_app_gen") do |dir|
      GeneratorAppBuilder.run_generator!(dir, "bin/rails generate wbez:app news_lab")

      assert File.exist?(File.join(dir, "app/controllers/news_labs_controller.rb"))
      assert File.exist?(File.join(dir, "app/views/news_labs/river.html.erb"))
      assert File.exist?(File.join(dir, "app/views/news_labs/experiments/baseline/_river.html.erb"))
      assert File.exist?(File.join(dir, "app/views/news_labs/experiments/dense_river/_river.html.erb"))
      assert_includes GeneratorAppBuilder.read_routes(dir), "news_lab"
    end
  end
end
