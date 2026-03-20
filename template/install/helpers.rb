# frozen_string_literal: true

module WbezBootstrapStarter
  module Install
    class Helpers
      def initialize(base)
        @base = base
        @g = base.generator
      end

      def install
        @base.copy_files(app_helpers_files)
      end

      private

      # app/helpers in this starter is small; we copy it file-by-file so the template works
      # when fetched from GitHub raw URLs.
      def app_helpers_files
        %w[
          app/helpers/application_helper.rb
          app/helpers/ui_helper.rb
        ]
      end
    end
  end
end

