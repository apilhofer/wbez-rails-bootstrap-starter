# frozen_string_literal: true

module WbezBootstrapStarter
  module Install
    class Bootstrap
      def initialize(base)
        @base = base
        @g = base.generator
      end

      def install
        @base.ensure_gem_present("cssbundling-rails")
        @base.ensure_gem_present("nokogiri")

        @g.run "bin/rails css:install:bootstrap"
      end
    end
  end
end

