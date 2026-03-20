# frozen_string_literal: true

module WbezBootstrapStarter
  module Install
    class Docs
      def initialize(base)
        @base = base
        @g = base.generator
      end

      def install
        @base.empty_dir "docs/design-system"
        @base.copy_files(docs_files)
      end

      private

      def docs_files
        %w[
          docs/design-system/bootstrap-wbez.md
          docs/design-system/cursor-native-guide.md
        ]
      end
    end
  end
end

