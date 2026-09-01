# frozen_string_literal: true

module AppPrototype
  module GeneratorBase
    module_function

    def normalized_page_type(options)
      normalized = options["type"].to_s.downcase
      normalized == "homepage" ? "home" : normalized
    end

    def app_route_prefix(file_name)
      "/#{file_name.to_s.dasherize}"
    end

    def experiment_ids
      %w[baseline dense_river]
    end
  end
end
