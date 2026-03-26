require "rails/generators"
require "rails/generators/named_base"

module Wbez
  class PageGenerator < Rails::Generators::NamedBase
    SUPPORTED_BRANDS = %w[wbez].freeze

    source_root File.expand_path("templates", __dir__)
    class_option :type,
      type: :string,
      default: "article",
      desc: "Page template type: article or home"
    class_option :brand,
      type: :string,
      desc: "Brand template namespace (required). Example: --brand=wbez"

    # rails g wbez:page investigative_article --type=article --brand=wbez
    # rails g wbez:page daily_brief_home --type=home --brand=wbez
    def create_controller
      validate_brand!
      template "controller.rb.tt", File.join("app/controllers", "#{plural_name.underscore}_controller.rb")
    end

    def create_view
      template "#{view_template_file}.html.erb.tt", File.join("app/views", plural_name, "show.html.erb")
    end

    def add_route
      route %(get "#{route_path}", to: "#{plural_name.underscore}#show", as: :#{route_helper_name})
    end

    private

    def controller_class_name
      "#{plural_name.camelize}Controller"
    end

    def normalized_brand
      options["brand"].to_s.strip.downcase
    end

    def brand
      value = normalized_brand
      if value.empty?
        raise Thor::Error, %(Missing required --brand option. Use --brand=wbez.)
      end

      return value if SUPPORTED_BRANDS.include?(value)

      raise Thor::Error, %(Unknown --brand "#{options["brand"]}". Supported brands: #{SUPPORTED_BRANDS.join(", ")}.)
    end

    def validate_brand!
      brand
    end

    def page_type
      normalized = options["type"].to_s.downcase
      normalized == "homepage" ? "home" : normalized
    end

    def view_template
      return page_type if %w[article home].include?(page_type)

      raise Thor::Error, %(Unknown --type "#{options["type"]}". Use "article" or "home".)
    end

    def view_template_file
      template_name = view_template == "article" ? "show" : view_template
      "#{brand}/#{template_name}"
    end

    def route_path
      "/#{file_name.underscore}"
    end

    def route_helper_name
      file_name.underscore
    end
  end
end

