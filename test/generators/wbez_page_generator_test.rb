# frozen_string_literal: true

require_relative "../test_helper"

class WbezPageGeneratorTest < Minitest::Test
  def test_article_generator_outputs
    skip "Set RUN_INTEGRATION=1 to run slow integration tests" unless ENV["RUN_INTEGRATION"] == "1"

    GeneratorAppBuilder.with_rails_app(name: "wbez_page_article") do |dir|
      GeneratorAppBuilder.run_generator!(dir, "bin/rails generate wbez:page investigative_article --type=article")

      assert File.exist?(File.join(dir, "app/controllers/investigative_articles_controller.rb"))
      assert File.exist?(File.join(dir, "app/views/investigative_articles/show.html.erb"))
      assert_includes GeneratorAppBuilder.read_routes(dir), 'get "/investigative_article"'
    end
  end

  def test_home_generator_outputs
    skip "Set RUN_INTEGRATION=1 to run slow integration tests" unless ENV["RUN_INTEGRATION"] == "1"

    GeneratorAppBuilder.with_rails_app(name: "wbez_page_home") do |dir|
      GeneratorAppBuilder.run_generator!(dir, "bin/rails generate wbez:page local_roundup_home --type=home")

      assert File.exist?(File.join(dir, "app/controllers/local_roundup_homes_controller.rb"))
      assert File.exist?(File.join(dir, "app/views/local_roundup_homes/show.html.erb"))
      assert_includes File.read(File.join(dir, "app/views/local_roundup_homes/show.html.erb")), "wbez-prototype"
    end
  end
end
