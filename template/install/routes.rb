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
              get "/demo/cookbook-suntimes", to: "demo#cookbook_suntimes"
              get "/demo/style-guide-wbez", to: "demo#style_guide_wbez"
              get "/demo/style-guide-suntimes", to: "demo#style_guide_suntimes"
              get "/demo/app-wbez", to: "demo_app#wbez", as: :demo_app_wbez
              get "/demo/app-wbez/listen", to: "demo_app#wbez_listen", as: :demo_app_wbez_listen
              get "/demo/app-wbez/browse", to: "demo_app#wbez_browse", as: :demo_app_wbez_browse
              get "/demo/app-wbez/menu", to: "demo_app#wbez_menu", as: :demo_app_wbez_menu
              get "/demo/app-suntimes", to: "demo_app#suntimes", as: :demo_app_suntimes
              get "/demo/app-suntimes/home", to: "demo_app#suntimes_home", as: :demo_app_suntimes_home
              get "/demo/app-wbez/stories/:id", to: "demo_app#wbez_story", as: :demo_app_wbez_story
              get "/demo/app-suntimes/stories/:id", to: "demo_app#suntimes_story", as: :demo_app_suntimes_story
              get "/demo/app-wbez/experiments", to: "demo_app#wbez_experiments", as: :demo_app_wbez_experiments
              get "/demo/app-suntimes/experiments", to: "demo_app#suntimes_experiments", as: :demo_app_suntimes_experiments
              post "/demo/app-wbez/experiments/:experiment_id", to: "demo_app#switch_wbez_experiment", as: :demo_app_wbez_experiment
              post "/demo/app-suntimes/experiments/:experiment_id", to: "demo_app#switch_suntimes_experiment", as: :demo_app_suntimes_experiment
            end

            # WBEZ_BOOTSTRAP_PWA_ROUTES
            get "/manifest.webmanifest", to: "pwa#manifest"
            get "/service-worker.js", to: "pwa#service_worker"
            get "/offline", to: "pwa#offline"
          RUBY

          @g.insert_into_file routes_path, development_block, before: /^end\s*$/
        end
      end
    end
  end
end

