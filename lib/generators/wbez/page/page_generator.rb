require "rails/generators"
require "rails/generators/named_base"

module Wbez
  class PageGenerator < Rails::Generators::NamedBase
    source_root File.expand_path("templates", __dir__)

    # rails g wbez:page Article
    def create_controller
      template "controller.rb.tt", File.join("app/controllers", "#{plural_name.underscore}_controller.rb")
    end

    def create_view
      template "show.html.erb.tt", File.join("app/views", plural_name, "show.html.erb")
    end

    private

    def controller_class_name
      "#{plural_name.camelize}Controller"
    end
  end
end

