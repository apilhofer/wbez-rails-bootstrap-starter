# frozen_string_literal: true

module WbezBootstrapStarter
  module Install
    class Editorial
      def initialize(base)
        @base = base
        @g = base.generator
      end

      def install
        @base.empty_dir "app/views/shared/ui"
        @base.copy_files(shared_ui_files)
        @base.copy_text_file "app/assets/stylesheets/application.bootstrap.scss"
      end

      private

      def shared_ui_files
        %w[
          app/views/shared/ui/_alert.html.erb
          app/views/shared/ui/_badge.html.erb
          app/views/shared/ui/_brand_lockup.html.erb
          app/views/shared/ui/_button.html.erb
          app/views/shared/ui/_card.html.erb
          app/views/shared/ui/_article_header.html.erb
          app/views/shared/ui/_article_shell.html.erb
          app/views/shared/ui/_figure.html.erb
          app/views/shared/ui/_hero_story.html.erb
          app/views/shared/ui/_pull_quote.html.erb
          app/views/shared/ui/_pagination.html.erb
          app/views/shared/ui/_responsive_embed.html.erb
          app/views/shared/ui/_section_header.html.erb
          app/views/shared/ui/_site_footer.html.erb
          app/views/shared/ui/_site_header.html.erb
          app/views/shared/ui/_story_card.html.erb
          app/views/shared/ui/_tabs.html.erb
          app/views/shared/ui/_field.html.erb
        ]
      end
    end
  end
end

