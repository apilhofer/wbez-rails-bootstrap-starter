# frozen_string_literal: true

module DemoWbezListenSampleData
  extend ActiveSupport::Concern

  private

  def assign_listen_schedule
    @now_playing = {
      title: "All Things Considered",
      time_range: "3 PM – 4:29 PM",
      live: true,
      artwork_label: "ATC",
      artwork_bg: "#1f3f8b",
      audio_url: nil
    }

    @earlier_shows = [
      { title: "Here & Now", aired_at: "Today at 2:00 PM", artwork_label: "HN", artwork_bg: "#4a5568" },
      { title: "Fresh Air with Terry Gross", aired_at: "Today at 1:00 PM", artwork_label: "FA", artwork_bg: "#2d3748" },
      { title: "1A", aired_at: "Today at 12:00 PM", artwork_label: "1A", artwork_bg: "#1a365d" },
      { title: "Morning Edition", aired_at: "Today at 11:00 AM", artwork_label: "ME", artwork_bg: "#234e52" },
      { title: "Morning Edition", aired_at: "Today at 10:00 AM", artwork_label: "ME", artwork_bg: "#234e52" },
      { title: "Morning Edition", aired_at: "Today at 9:00 AM", artwork_label: "ME", artwork_bg: "#234e52" },
      { title: "Morning Edition", aired_at: "Today at 8:00 AM", artwork_label: "ME", artwork_bg: "#234e52" },
      { title: "Morning Edition", aired_at: "Today at 7:00 AM", artwork_label: "ME", artwork_bg: "#234e52" },
      { title: "Morning Edition", aired_at: "Today at 6:00 AM", artwork_label: "ME", artwork_bg: "#234e52" }
    ]
  end
end
