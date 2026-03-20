# frozen_string_literal: true

require "fileutils"
require "open-uri"

module WbezBootstrapStarter
  module Install
    class Assets
      def initialize(base)
        @base = base
        @g = base.generator
      end

      def install
        install_brand_assets
        install_npm_and_css_pipeline
      end

      private

      def install_brand_assets
        @base.empty_dir "app/assets/images/logos"
        @base.empty_dir "app/assets/images/icons/wbez"
        @base.empty_dir "app/assets/images/icons/marketing"

        # Offline/fallback icon set (remote installs may still be networked, but we keep
        # a baseline local copy if Ferris extraction fails).
        wbez_icon_files = %w[
          cursor
          envelope
          external-link
          facebook
          feedburner
          heart
          instagram
          jump-back
          jump-forward
          link
          menu
          pause
          pdf
          play
          plus
          rss
          search
          skip-back
          skip-forward
          stop
          times
          twitter
          youtube
        ].map { |name| "app/assets/images/icons/wbez/#{name}.svg" }

        wbez_icon_files.each { |rel_path| @base.copy_text_file(rel_path) }

        # Download logos into app/assets/images/logos.
        logo_sources = {
          "app/assets/images/logos/cpm-global-header.svg" =>
            "https://cst.brightspotcdn.com/2a/98/f071f53548639088edca14d9a392/cpm-global-header.svg",
          "app/assets/images/logos/cst-global-header.svg" =>
            "https://cst.brightspotcdn.com/d9/fb/5be4f3974c0f810df3518b0761fe/cst-global-header.svg",
          "app/assets/images/logos/wbez-standard-logo.svg" =>
            "https://cst.brightspotcdn.com/76/9a/93bf26c94cf28fc304cadf87cd8e/wbez-logo-white-red.svg",
          "app/assets/images/logos/cpm-logo.png" =>
            "https://ferris-ds.wbez.org/logos/cpm-logo.png",
          "app/assets/images/logos/vocalo-logo-oneline.svg" =>
            "https://ferris-ds.wbez.org/logos/vocalo-logo-oneline.svg",
          "app/assets/images/logos/vocalo-logo-stacked.svg" =>
            "https://ferris-ds.wbez.org/logos/vocalo-logo-stacked.svg",
          "app/assets/images/logos/wbez-915-chicago-logo-oneline--light.svg" =>
            "https://ferris-ds.wbez.org/logos/wbez-915-chicago-logo-oneline--light.svg",
          "app/assets/images/logos/wbez-915-chicago-logo-oneline.svg" =>
            "https://ferris-ds.wbez.org/logos/wbez-915-chicago-logo-oneline.svg",
          "app/assets/images/logos/wbez-915-chicago-logo-stacked.svg" =>
            "https://ferris-ds.wbez.org/logos/wbez-915-chicago-logo-stacked.svg",
          "app/assets/images/logos/wbez-chicago-logo-oneline--dark-theme.svg" =>
            "https://ferris-ds.wbez.org/logos/wbez-chicago-logo-oneline--dark-theme.svg",
          "app/assets/images/logos/wbez-chicago-logo-oneline.svg" =>
            "https://ferris-ds.wbez.org/logos/wbez-chicago-logo-oneline.svg",
          "app/assets/images/logos/wbez-chicago-logo-tagline--dark-theme.svg" =>
            "https://ferris-ds.wbez.org/logos/wbez-chicago-logo-tagline--dark-theme.svg",
          "app/assets/images/logos/wbez-chicago-logo-tagline.svg" =>
            "https://ferris-ds.wbez.org/logos/wbez-chicago-logo-tagline.svg",
          "app/assets/images/logos/wbez-rundown-logo.svg" =>
            "https://ferris-ds.wbez.org/logos/wbez-rundown-logo.svg",
          "app/assets/images/logos/wbez-square.svg" =>
            "https://ferris-ds.wbez.org/logos/wbez-square.svg"
        }

        logo_sources.each do |destination, url|
          download_file(url, destination)
        end

        # Extract Ferris icons from the Ferris docs HTML into standalone SVGs.
        begin
          ferris_html = URI.open("https://ferris-ds.wbez.org/").read
          symbols = ferris_html.scan(/<symbol id="([^"]+)"([^>]*)>(.*?)<\/symbol>/m)

          symbols.each do |name, attrs, body|
            next unless attrs =~ /viewBox="([^"]+)"/

            view_box = Regexp.last_match(1)

            group =
              if %w[
                cursor envelope external-link facebook feedburner heart instagram jump-back
                jump-forward link menu microphone news pause pdf play plus rss search skip-back
                skip-forward stop times twitter youtube
              ].include?(name)
                "wbez"
              else
                "marketing"
              end

            destination = "app/assets/images/icons/#{group}/#{name}.svg"

            FileUtils.mkdir_p(File.dirname(destination))
            File.write(destination, %(<svg xmlns="http://www.w3.org/2000/svg" viewBox="#{view_box}">#{body}</svg>\n))
          end
        rescue => e
          @g.say "Ferris icon extraction skipped: #{e.message}"
        end
      end

      def download_file(url, destination)
        @g.run %(mkdir -p "#{File.dirname(destination)}")
        @g.run %(curl -fsSL "#{url}" -o "#{destination}")
      end

      def install_npm_and_css_pipeline
        @g.run "npm install --save-dev sass nodemon postcss postcss-cli autoprefixer"
        @g.run "npm install bootstrap bootstrap-icons @popperjs/core"

        @g.run %(npm pkg set scripts.build:css:compile="sass ./app/assets/stylesheets/application.bootstrap.scss:./app/assets/builds/application.css --no-source-map --load-path=node_modules")
        @g.run %(npm pkg set scripts.build:css:prefix="postcss ./app/assets/builds/application.css --use=autoprefixer --output=./app/assets/builds/application.css")
        @g.run %(npm pkg set scripts.build:css="npm run build:css:compile && npm run build:css:prefix")
        @g.run %q(npm pkg set scripts.watch:css='nodemon --watch ./app/assets/stylesheets/ --ext scss --exec "npm run build:css"')

        procfile = "Procfile.dev"
        if File.exist?(procfile)
          contents = File.read(procfile)
          web_line = contents.lines.find { |line| line.start_with?("web:") } ||
                      "web: env RUBY_DEBUG_OPEN=true bin/rails server\n"
          File.write(procfile, web_line + "css: npm run watch:css\n")
        else
          File.write(procfile, "web: env RUBY_DEBUG_OPEN=true bin/rails server\ncss: npm run watch:css\n")
        end

        @g.run "npm run build:css"
      end
    end
  end
end

