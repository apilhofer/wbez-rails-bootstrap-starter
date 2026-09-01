# frozen_string_literal: true

class PwaController < ApplicationController
  skip_forgery_protection only: :service_worker

  def manifest
    brand = params[:brand].to_s == "suntimes" ? "suntimes" : "wbez"
    @manifest = manifest_payload(brand)
    render json: @manifest
  end

  def service_worker
    render file: Rails.public_path.join("service-worker.js"), content_type: "application/javascript", layout: false
  end

  def offline
    render layout: "app"
  end

  private

  def manifest_payload(brand)
    if brand == "suntimes"
      {
        name: "Sun-Times App Prototype",
        short_name: "CST Lab",
        start_url: "/demo/app-suntimes",
        display: "standalone",
        background_color: "#ffffff",
        theme_color: "#c41230",
        icons: pwa_icons("suntimes")
      }
    else
      {
        name: "WBEZ App Prototype",
        short_name: "WBEZ Lab",
        start_url: "/demo/app-wbez",
        display: "standalone",
        background_color: "#ffffff",
        theme_color: "#ed0000",
        icons: pwa_icons("wbez")
      }
    end
  end

  def pwa_icons(brand)
    [
      { src: "/pwa/#{brand}/icon-192.png", sizes: "192x192", type: "image/png" },
      { src: "/pwa/#{brand}/icon-512.png", sizes: "512x512", type: "image/png" }
    ]
  end
end
