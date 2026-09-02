# frozen_string_literal: true

module AppPrototypeHelper
  def app_body_class
    brand = @app_brand.presence || params[:brand].presence || "wbez"
    base = brand.to_s == "suntimes" ? "suntimes-app-prototype" : "wbez-app-prototype"
    [base, @append_body_class].compact.join(" ")
  end

  def app_theme_color
    return "#000000" if %w[wbez-app-prototype--listen wbez-app-prototype--browse wbez-app-prototype--menu].include?(@append_body_class)
    return "#ffffff" if @append_body_class == "suntimes-app-prototype--home"

    app_body_class.include?("suntimes") ? "#d3242c" : "#ed0000"
  end

  def app_manifest_path
    brand = app_body_class.include?("suntimes") ? "suntimes" : "wbez"
    "/manifest.webmanifest?brand=#{brand}"
  end

  def app_icon_path
    brand = app_body_class.include?("suntimes") ? "suntimes" : "wbez"
    "/pwa/#{brand}/icon-192.png"
  end

  def app_story_path(app_name, story, brand: "wbez")
    send(:"#{app_name.singularize}_story_path", story[:id], brand: brand)
  rescue NoMethodError
    "#"
  end

  def app_default_tabs(app_name)
    base = "/#{app_name.to_s.dasherize}"
    [
      { id: "latest", label: "Latest", href: base },
      { id: "listen", label: "Listen", href: "#{base}/listen" },
      { id: "saved", label: "Saved", href: "#{base}/saved" }
    ]
  end
end
