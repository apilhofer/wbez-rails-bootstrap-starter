# frozen_string_literal: true

module WbezBootstrapStarter
  module Install
    class Routes
      def initialize(base)
        @base = base
        @g = base.generator
      end

      def install
        route_marker = "# WBEZ_BOOTSTRAP_DEMO_ROUTES"
        routes_path = "config/routes.rb"
        routes = File.read(routes_path)

        # v2 template: never sets the app root to demo pages.
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

          @g.insert_into_file routes_path, development_block, before: /^end\s*$/
        end
      end
    end
  end
end

