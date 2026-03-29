# frozen_string_literal: true

module WbezBootstrapStarter
  module Install
    class Demos
      def initialize(base)
        @base = base
        @g = base.generator
      end

      def install
        @base.empty_dir "app/controllers/concerns"
        @base.copy_files(demo_controller_files)

        @base.empty_dir "app/views/demo"
        @base.empty_dir "app/views/demo/wbez"
        @base.empty_dir "app/views/demo/suntimes"
        @base.copy_files(demo_view_files)
      end

      private

      def demo_controller_files
        %w[
          app/controllers/demo_controller.rb
          app/controllers/concerns/demo_suntimes_homepage_sample_data.rb
          app/controllers/concerns/demo_wbez_sample_data.rb
        ]
      end

      def demo_view_files
        %w[
          app/views/demo/_results.html.erb
          app/views/demo/_results_frame.html.erb
          app/views/demo/wbez/article.html.erb
          app/views/demo/wbez/cookbook.html.erb
          app/views/demo/suntimes/cookbook_suntimes.html.erb
          app/views/demo/wbez/home.html.erb
          app/views/demo/wbez/icons.html.erb
          app/views/demo/index.html.erb
          app/views/demo/wbez/logos.html.erb
          app/views/demo/wbez/style_guide_wbez.html.erb
          app/views/demo/suntimes/style_guide_suntimes.html.erb
        ]
      end
    end
  end
end
