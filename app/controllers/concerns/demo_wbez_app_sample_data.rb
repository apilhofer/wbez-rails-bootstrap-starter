# frozen_string_literal: true

module DemoWbezAppSampleData
  extend ActiveSupport::Concern

  def assign_wbez_app_sample_stories
    @app_stories = [
      {
        id: "1",
        kicker: "Chicago",
        title: "City Council preview: housing, budget, and a contested development vote",
        dek: "Five things to watch before tomorrow's meeting.",
        published_ago: "55m ago",
        read: "4m read",
        body: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p><p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>",
        audio_url: nil
      },
      {
        id: "2",
        kicker: "Education",
        title: "Chicago Public Schools enrollment: five charts that show where things stand",
        dek: "Enrollment shifts continue across the district.",
        published_ago: "2h ago",
        read: "6m read",
        body: "<p>Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>",
        audio_url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3"
      },
      {
        id: "3",
        kicker: "Arts",
        title: "A new wave of neighborhood venues is changing where Chicago hears music",
        published_ago: "4h ago",
        read: "5m read",
        body: "<p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>"
      }
    ]
    @featured_story = @app_stories.first
  end
end
