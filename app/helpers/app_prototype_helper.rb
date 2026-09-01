# frozen_string_literal: true

module AppPrototypeHelper
  def app_body_class
    brand = @app_brand.presence || params[:brand].presence || "wbez"
    brand.to_s == "suntimes" ? "suntimes-app-prototype" : "wbez-app-prototype"
  end

  def app_theme_color
    app_body_class.include?("suntimes") ? "#c41230" : "#ed0000"
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
