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
        @base.copy_text_file "app/assets/stylesheets/brands/_wbez.scss"
        @base.copy_text_file "app/assets/stylesheets/brands/_suntimes.scss"
        @base.copy_text_file "app/assets/stylesheets/brands/_suntimes_home_visily.scss"
        # Used by `shared/ui/full_width_promo_spot` default `image_src` and Sun-Times Visily homepage placeholders.
        @base.copy_text_file "app/assets/images/image.webp"
        @base.copy_files(suntimes_visily_images)
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
          app/views/shared/ui/_listen_pill.html.erb
          app/views/shared/ui/_pull_quote.html.erb
          app/views/shared/ui/_pagination.html.erb
          app/views/shared/ui/_responsive_embed.html.erb
          app/views/shared/ui/_section_header.html.erb
          app/views/shared/ui/_bsp_list_loadmore_featured_audio.html.erb
          app/views/shared/ui/_list_carousel.html.erb
          app/views/shared/ui/_embed_module.html.erb
          app/views/shared/ui/_curious_city_promo.html.erb
          app/views/shared/ui/_one_column_event_list.html.erb
          app/views/shared/ui/_one_column_top_list.html.erb
          app/views/shared/ui/_full_width_promo_spot.html.erb
          app/views/shared/ui/_site_footer.html.erb
          app/views/shared/ui/_site_footer_suntimes.html.erb
          app/views/shared/ui/_site_header.html.erb
          app/views/shared/ui/_site_header_wbez.html.erb
          app/views/shared/ui/_site_header_suntimes.html.erb
          app/views/shared/ui/_cst_utility_dropdown.html.erb
          app/views/shared/ui/_cst_nav_dropdown.html.erb
          app/views/shared/ui/_article_shell_suntimes.html.erb
          app/views/shared/ui/_story_card.html.erb
          app/views/shared/ui/_tabs.html.erb
          app/views/shared/ui/_field.html.erb
          app/views/shared/ui/suntimes/home/_home_main.html.erb
          app/views/shared/ui/suntimes/home/_hero.html.erb
          app/views/shared/ui/suntimes/home/_commentary.html.erb
          app/views/shared/ui/suntimes/home/_chicago.html.erb
          app/views/shared/ui/suntimes/home/_news_politics.html.erb
          app/views/shared/ui/suntimes/home/_investigations.html.erb
          app/views/shared/ui/suntimes/home/_newsletter.html.erb
          app/views/shared/ui/suntimes/home/_arts.html.erb
          app/views/shared/ui/suntimes/home/_sports.html.erb
        ]
      end

      def suntimes_visily_images
        %w[
          app/assets/images/suntimes-visily/IMG_1.svg
          app/assets/images/suntimes-visily/IMG_2.svg
          app/assets/images/suntimes-visily/IMG_3.svg
          app/assets/images/suntimes-visily/IMG_4.svg
          app/assets/images/suntimes-visily/IMG_5.svg
          app/assets/images/suntimes-visily/IMG_6.svg
          app/assets/images/suntimes-visily/IMG_7.svg
          app/assets/images/suntimes-visily/IMG_8.svg
          app/assets/images/suntimes-visily/IMG_10.svg
          app/assets/images/suntimes-visily/IMG_22.svg
          app/assets/images/suntimes-visily/IMG_30.svg
          app/assets/images/suntimes-visily/IMG_31.svg
          app/assets/images/suntimes-visily/IMG_69.svg
          app/assets/images/suntimes-visily/IMG_70.svg
          app/assets/images/suntimes-visily/IMG_71.svg
          app/assets/images/suntimes-visily/IMG_72.svg
          app/assets/images/suntimes-visily/IMG_73.svg
        ]
      end
    end
  end
end

