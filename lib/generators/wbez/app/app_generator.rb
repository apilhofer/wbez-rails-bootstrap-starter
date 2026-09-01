# frozen_string_literal: true

require "rails/generators"
require "rails/generators/named_base"
require_relative "../../app_prototype/generator_base"

module Wbez
  class AppGenerator < Rails::Generators::NamedBase
    source_root File.expand_path("templates", __dir__)

    def create_controller
      template "controller.rb.tt", File.join("app/controllers", "#{plural_name.underscore}_controller.rb")
    end

    def create_experiment_views
      AppPrototype::GeneratorBase.experiment_ids.each do |experiment|
        @experiment_dense = experiment == "dense_river"
        template "experiments/river.html.erb.tt",
          File.join("app/views", plural_name, "experiments", experiment, "_river.html.erb")
      end
    end

    def create_story_view
      template "story.html.erb.tt", File.join("app/views", plural_name, "story.html.erb")
    end

    def create_river_view
      template "river.html.erb.tt", File.join("app/views", plural_name, "river.html.erb")
    end

    def create_experiments_view
      template "experiments.html.erb.tt", File.join("app/views", plural_name, "experiments.html.erb")
    end

    def add_routes
      route <<~RUBY
        get "#{route_prefix}", to: "#{plural_name.underscore}#river", as: :#{route_helper_name}
        get "#{route_prefix}/stories/:id", to: "#{plural_name.underscore}#story", as: :#{route_helper_name.singularize}_story
        get "#{route_prefix}/experiments", to: "#{plural_name.underscore}#experiments", as: :#{route_helper_name}_experiments
        post "#{route_prefix}/experiments/:experiment_id", to: "#{plural_name.underscore}#switch_experiment", as: :#{route_helper_name}_experiment
      RUBY
    end

    def add_app_registry_entry
      entry = <<~YAML
          #{plural_name.underscore}:
            experiments:
              - id: baseline
                label: Baseline
                description: Default #{file_name} app river.
              - id: dense_river
                label: Dense river
                description: Higher story density for #{file_name}.
      YAML

      inject_into_file "config/app_prototype.yml", after: /^  demo_app_suntimes:\n(?:^    .+\n)*\n/m do
        entry
      end
    end

    private

    def route_prefix
      AppPrototype::GeneratorBase.app_route_prefix(file_name)
    end

    def route_helper_name
      file_name.underscore
    end
  end
end
