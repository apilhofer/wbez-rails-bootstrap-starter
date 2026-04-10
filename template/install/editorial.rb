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
        @base.copy_text_file "app/assets/stylesheets/brands/_suntimes_tokens.scss"
        @base.copy_text_file "app/assets/stylesheets/brands/_suntimes.scss"
        @base.copy_text_file "app/assets/stylesheets/brands/_suntimes_homepage.scss"
        # Default graphic for `full_width_promo_spot` when not using `graphic_placeholder:` (grey div partial).
        @base.copy_text_file "app/assets/images/image.webp"
        @base.copy_text_file "app/assets/images/ctimes-logo.svg"
        @base.copy_text_file "app/assets/images/a0edb9a03c1cef71abe3815120bea99d.png"
        @base.copy_files(suntimes_homepage_images)
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
          app/views/shared/ui/wbez/_site_header.html.erb
          app/views/shared/ui/wbez/_site_footer.html.erb
          app/views/shared/ui/wbez/_article_shell.html.erb
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
          app/views/shared/ui/suntimes/_site_header.html.erb
          app/views/shared/ui/suntimes/_site_footer.html.erb
          app/views/shared/ui/suntimes/_article_shell.html.erb
          app/views/shared/ui/suntimes/_utility_dropdown.html.erb
          app/views/shared/ui/suntimes/_nav_dropdown.html.erb
          app/views/shared/ui/_story_card.html.erb
          app/views/shared/ui/_tabs.html.erb
          app/views/shared/ui/_field.html.erb
          app/views/shared/ui/suntimes/home/_home_main.html.erb
          app/views/shared/ui/suntimes/_placeholder_rect.html.erb
          app/views/shared/ui/suntimes/home/_hero.html.erb
          app/views/shared/ui/suntimes/home/_story_meta.html.erb
          app/views/shared/ui/suntimes/home/_one_column_section_zone.html.erb
          app/views/shared/ui/suntimes/home/_two_column_section.html.erb
          app/views/shared/ui/suntimes/home/_two_column_section_main.html.erb
          app/views/shared/ui/suntimes/home/_commentary.html.erb
          app/views/shared/ui/suntimes/home/_chicago.html.erb
          app/views/shared/ui/suntimes/home/_news_politics.html.erb
          app/views/shared/ui/suntimes/home/_investigations.html.erb
          app/views/shared/ui/suntimes/home/_newsletter.html.erb
          app/views/shared/ui/suntimes/home/_paying_your_taxes.html.erb
          app/views/shared/ui/suntimes/home/_bears.html.erb
          app/views/shared/ui/suntimes/home/_bottom_four_rails.html.erb
          app/views/shared/ui/suntimes/home/_sports_four_rails.html.erb
          app/views/shared/ui/suntimes/home/_news_regions_four_rails.html.erb
          app/views/shared/ui/suntimes/home/_opinion_four_rails.html.erb
          app/views/shared/ui/suntimes/home/_full_width_ad_unit.html.erb
          app/views/shared/ui/suntimes/home/_all_latest_stories_cta.html.erb
          app/views/shared/ui/suntimes/home/_wbez_promo_zone.html.erb
          app/views/shared/ui/suntimes/home/_arts.html.erb
          app/views/shared/ui/suntimes/home/_sports.html.erb
          app/views/shared/ui/wbez/style_guide/_tokens.html.erb
          app/views/shared/ui/wbez/style_guide/_typography.html.erb
          app/views/shared/ui/wbez/style_guide/_components.html.erb
          app/views/shared/ui/suntimes/style_guide/_tokens.html.erb
          app/views/shared/ui/suntimes/style_guide/_typography.html.erb
          app/views/shared/ui/suntimes/style_guide/_components.html.erb
        ]
      end

      def suntimes_homepage_images
        %w[
          app/assets/images/suntimes/homepage/IMG_1.svg
          app/assets/images/suntimes/homepage/IMG_2.svg
          app/assets/images/suntimes/homepage/IMG_3.svg
          app/assets/images/suntimes/homepage/IMG_4.svg
          app/assets/images/suntimes/homepage/IMG_5.svg
          app/assets/images/suntimes/homepage/IMG_6.svg
          app/assets/images/suntimes/homepage/IMG_7.svg
          app/assets/images/suntimes/homepage/IMG_8.svg
          app/assets/images/suntimes/homepage/IMG_10.svg
          app/assets/images/suntimes/homepage/IMG_22.svg
          app/assets/images/suntimes/homepage/IMG_30.svg
          app/assets/images/suntimes/homepage/IMG_31.svg
          app/assets/images/suntimes/homepage/IMG_69.svg
          app/assets/images/suntimes/homepage/IMG_70.svg
          app/assets/images/suntimes/homepage/IMG_71.svg
          app/assets/images/suntimes/homepage/IMG_72.svg
          app/assets/images/suntimes/homepage/IMG_73.svg
        ]
      end
    end
  end
end

