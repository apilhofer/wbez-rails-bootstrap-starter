# frozen_string_literal: true

require "base64"
require "fileutils"

module WbezBootstrapStarter
  module Install
    class AppShell
      def initialize(base)
        @base = base
        @g = base.generator
      end

      def install
        @base.copy_files(app_shell_files)
        ensure_scss_imports
        write_pwa_placeholder_icons
      end

      private

      def app_shell_files
        %w[
          app/assets/stylesheets/brands/_app_shell.scss
          app/assets/stylesheets/brands/_wbez_app.scss
          app/assets/stylesheets/brands/_suntimes_app.scss
          app/views/layouts/app.html.erb
          app/views/shared/ui/app/_story_row.html.erb
          app/views/shared/ui/app/_empty_state.html.erb
          app/views/shared/ui/app/_loading_skeleton.html.erb
          app/views/shared/ui/app/_sheet.html.erb
          app/views/shared/ui/app/_experiment_selector.html.erb
          app/views/shared/ui/app/_mini_audio_player.html.erb
          app/views/shared/ui/app/_full_audio_player.html.erb
          app/views/shared/ui/app/_saved_button.html.erb
          app/views/shared/ui/wbez/app/_app_header.html.erb
          app/views/shared/ui/wbez/app/_bottom_tab_bar.html.erb
          app/views/shared/ui/wbez/app/_article_shell.html.erb
          app/views/shared/ui/suntimes/app/_app_header.html.erb
          app/views/shared/ui/suntimes/app/_bottom_tab_bar.html.erb
          app/views/shared/ui/suntimes/app/_article_shell.html.erb
          app/helpers/app_prototype_helper.rb
          app/controllers/concerns/app_experiment.rb
          app/controllers/concerns/app_prototype_state.rb
          app/controllers/pwa_controller.rb
          app/controllers/demo_app_controller.rb
          app/controllers/concerns/demo_wbez_app_sample_data.rb
          app/controllers/concerns/demo_suntimes_app_sample_data.rb
          app/views/pwa/offline.html.erb
          app/views/demo_app/wbez.html.erb
          app/views/demo_app/suntimes.html.erb
          app/views/demo_app/story.html.erb
          app/views/demo_app/experiments.html.erb
          app/views/demo/app/wbez/experiments/baseline/_river.html.erb
          app/views/demo/app/wbez/experiments/dense_river/_river.html.erb
          app/views/demo/app/suntimes/experiments/baseline/_river.html.erb
          app/views/demo/app/suntimes/experiments/dense_river/_river.html.erb
          app/javascript/controllers/pwa_register_controller.js
          app/javascript/controllers/app_audio_controller.js
          app/javascript/controllers/saved_story_controller.js
          app/javascript/controllers/app_sheet_controller.js
          config/app_prototype.yml
          public/service-worker.js
          docs/app-prototype/README.md
          docs/app-prototype/pwa-install-guide.md
          docs/app-prototype/deploy.md
        ]
      end

      def ensure_scss_imports
        path = "app/assets/stylesheets/application.bootstrap.scss"
        return unless File.exist?(path)

        contents = File.read(path)
        imports = %w[brands/app_shell brands/wbez_app brands/suntimes_app]
        imports.each do |import_name|
          line = %(@import "#{import_name}";)
          next if contents.include?(line)

          contents = contents.rstrip + "\n#{line}\n"
        end
        File.write(path, contents)
      end

      def write_pwa_placeholder_icons
        %w[wbez suntimes].each do |brand|
          color = brand == "suntimes" ? [196, 18, 48] : [237, 0, 0]
          { "192" => 192, "512" => 512 }.each do |label, size|
            destination = "public/pwa/#{brand}/icon-#{label}.png"
            next if File.exist?(destination)

            FileUtils.mkdir_p(File.dirname(destination))
            File.binwrite(destination, minimal_png(color, size))
          end
        end
      end

      def minimal_png(_rgb, _size)
        Base64.decode64("iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mP8z8BQDwAEhQGAhKmMIQAAAABJRU5ErkJggg==")
      end
    end
  end
end
