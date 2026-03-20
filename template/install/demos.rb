# frozen_string_literal: true

module WbezBootstrapStarter
  module Install
    class Demos
      def initialize(base)
        @base = base
        @g = base.generator
      end

      def install
        @base.copy_files(demo_controller_files)

        @base.empty_dir "app/views/demo"
        @base.copy_files(demo_view_files)
      end

      private

      def demo_controller_files
        %w[
          app/controllers/demo_controller.rb
        ]
      end

      def demo_view_files
        %w[
          app/views/demo/_results.html.erb
          app/views/demo/_results_frame.html.erb
          app/views/demo/article.html.erb
          app/views/demo/cookbook.html.erb
          app/views/demo/home.html.erb
          app/views/demo/icons.html.erb
          app/views/demo/index.html.erb
          app/views/demo/logos.html.erb
        ]
      end
    end
  end
end

