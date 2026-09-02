# frozen_string_literal: true

module DemoWbezBrowseSampleData
  extend ActiveSupport::Concern

  private

  def assign_browse_content
    @now_playing = {
      title: "Marketplace",
      time_range: "4:30 PM – 4:59 PM",
      live: true,
      artwork_label: "MP",
      artwork_bg: "#1a365d",
      audio_url: nil
    }

    @news_snippets = [
      {
        title: "Illinois wraps up extreme meteorological summer nearing all-time heat records",
        artwork_bg: "linear-gradient(180deg, rgba(0,0,0,0.05) 0%, rgba(0,0,0,0.75) 100%), linear-gradient(135deg, #4a90c4 0%, #1a3a5c 50%, #0d2137 100%)"
      },
      {
        title: "Chicago Public Schools approves new contract after months of negotiations",
        artwork_bg: "linear-gradient(180deg, rgba(0,0,0,0.05) 0%, rgba(0,0,0,0.75) 100%), linear-gradient(135deg, #6b7280 0%, #374151 100%)"
      },
      {
        title: "CTA riders face service changes as agency weighs budget shortfall",
        artwork_bg: "linear-gradient(180deg, rgba(0,0,0,0.05) 0%, rgba(0,0,0,0.75) 100%), linear-gradient(135deg, #92400e 0%, #451a03 100%)"
      }
    ]

    @featured_audio = {
      title: "THE RUNDOWN",
      meta: "1 min / Monday, August 31, 2026",
      artwork_label: "TR",
      artwork_bg: "#2d5a3d"
    }

    @newscasts = [
      { title: "WBEZ Newscast: 4:00 PM", artwork_label: "WBEZ", artwork_bg: "#ed0000" },
      { title: "NPR Newscast: 4:11 PM", artwork_label: "NPR", artwork_bg: "#1a1a1a" }
    ]

    @podcasts = [
      { title: "In The Loop", artwork_label: "ITL", artwork_bg: "#c53030" },
      { title: "Say More", artwork_label: "SM", artwork_bg: "#2b6cb0" },
      { title: "The Rundown", artwork_label: "TR", artwork_bg: "#2d5a3d" },
      { title: "WBEZ Chicago", artwork_label: "WBEZ", artwork_bg: "#ed0000" },
      { title: "Curious City", artwork_label: "CC", artwork_bg: "#d69e2e" },
      { title: "Becoming Bovino", artwork_label: "BB", artwork_bg: "#805ad5" },
      { title: "When Magic Happens", artwork_label: "WMH", artwork_bg: "#319795" },
      { title: "Motive", artwork_label: "MV", artwork_bg: "#1a202c" },
      { title: "16 Shots", artwork_label: "16", artwork_bg: "#2d3748" },
      { title: "Art of Power", artwork_label: "AOP", artwork_bg: "#744210" },
      { title: "WBEZ Chicago", artwork_label: "WBEZ", artwork_bg: "#ed0000" },
      { title: "Public Official A", artwork_label: "POA", artwork_bg: "#4a5568" },
      { title: "Shoes Off", artwork_label: "SO", artwork_bg: "#9b2c2c" },
      { title: "South Side Stories", artwork_label: "SSS", artwork_bg: "#276749" },
      { title: "Nerdette", artwork_label: "ND", artwork_bg: "#553c9a" }
    ]
  end
end
