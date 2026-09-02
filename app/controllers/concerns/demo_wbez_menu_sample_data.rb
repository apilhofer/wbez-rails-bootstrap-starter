# frozen_string_literal: true

module DemoWbezMenuSampleData
  extend ActiveSupport::Concern

  private

  def assign_menu_content
    @menu_items = [
      { label: "WBEZ.org", icon: "globe", href: "https://www.wbez.org", external: true },
      { label: "Donate", icon: "donate", href: "#" },
      { label: "Newsletter Sign Up", icon: "envelope", href: "#" },
      { label: "Radio Schedule", icon: "calendar", href: "#" },
      { label: "Contact Us", icon: "contact", href: "#" }
    ]

    @notification_frequencies = [
      { id: "regular", label: "Regular News Updates", selected: true },
      { id: "special", label: "Special News Coverage", selected: false }
    ]

    @app_version = "9.3.1"
  end
end
