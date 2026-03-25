# frozen_string_literal: true

require "fileutils"
require "uri"
require "open-uri"

module WbezBootstrapStarter
  module Install
    class Base
      attr_reader :source_base_url, :generator

      TEMPLATE_ENTRYPOINT = "template/bootstrap_template.rb"

      def initialize(generator, location: ENV["LOCATION"])
        @generator = generator
        @location = location.to_s

        @remote = @location.match?(/\Ahttps?:\/\//)
        @source_base_url = @remote ? compute_source_base_url(@location) : nil
      end

      def remote?
        @remote
      end

      def template_root
        File.expand_path("../..", __dir__)
      end

      def compute_source_base_url(location)
        location.sub(%r{/#{Regexp.escape(TEMPLATE_ENTRYPOINT)}\z}, "").sub(%r{/+\z}, "")
      end

      def fetch_template_text(rel_path)
        if remote?
          url = "#{@source_base_url}/#{rel_path}"
          URI.open(url).read
        else
          File.read(File.join(template_root, rel_path))
        end
      end

      # Copies a text-like file from this template repo into the generated Rails app.
      # Works in both local and remote (GitHub raw) installs.
      def copy_text_file(rel_path, destination_rel_path = rel_path)
        content = fetch_template_text(rel_path)
        destination_abs = Rails.root.join(destination_rel_path)
        FileUtils.mkdir_p(destination_abs.dirname)
        File.write(destination_abs, content)
      end

      def copy_files(rel_paths)
        rel_paths.each { |rel_path| copy_text_file(rel_path) }
      end

      def empty_dir(rel_path)
        generator.empty_directory rel_path
      end

      def ensure_gem_present(gem_name)
        gemfile_contents = File.read("Gemfile")
        gem_re = /gem\s+["']#{Regexp.escape(gem_name)}["']/
        return if gemfile_contents.match?(gem_re)

        generator.run "bundle add #{gem_name}"
      end

      def write_marker_file(installed_version:)
        marker = {
          "installed_version" => installed_version,
          "source_base_url" => source_base_url
        }

        destination = Rails.root.join("config", "wbez_bootstrap_starter.yml")
        FileUtils.mkdir_p(destination.dirname)
        File.write(destination, marker.to_yaml)
      end

      def copy_support_lib
        copy_files(support_lib_files)
      end

      private

      def support_lib_files
        %w[
          lib/wbez_bootstrap_starter/version.rb
          lib/tasks/wbez_bootstrap_starter.rake
          lib/generators/wbez/page/page_generator.rb
          lib/generators/wbez/page/templates/controller.rb.tt
          lib/generators/wbez/page/templates/show.html.erb.tt
          lib/generators/wbez/page/templates/home.html.erb.tt
        ]
      end
    end
  end
end

