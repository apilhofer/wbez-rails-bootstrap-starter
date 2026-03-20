# frozen_string_literal: true

module WbezBootstrapStarter
  module Install
    class Cursor
      def initialize(base)
        @base = base
        @g = base.generator
      end

      def install
        @base.empty_dir ".cursor/rules"

        @base.copy_files(cursor_files)
      end

      private

      def cursor_files
        [
          "AGENTS.md",
          ".cursor/rules/wbez-bootstrap.mdc"
        ]
      end
    end
  end
end

