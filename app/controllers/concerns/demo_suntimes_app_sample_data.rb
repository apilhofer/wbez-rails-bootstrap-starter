# frozen_string_literal: true

module DemoSuntimesAppSampleData
  extend ActiveSupport::Concern

  def assign_suntimes_app_sample_stories
    @app_stories = [
      {
        id: "1",
        kicker: "News",
        title: "Mayor's office outlines new transit safety plan ahead of summer events",
        dek: "Officials say the plan focuses on high-traffic corridors.",
        published_ago: "38m ago",
        read: "3m read",
        body: "<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.</p>",
        author_name: "Jane Reporter"
      },
      {
        id: "2",
        kicker: "Sports",
        title: "Bears minicamp notes: offense installs new tempo in red-zone drills",
        published_ago: "1h ago",
        read: "4m read",
        body: "<p>Curabitur blandit tempus porttitor. Maecenas sed diam eget risus varius blandit sit amet non magna.</p>"
      },
      {
        id: "3",
        kicker: "Politics",
        title: "Springfield budget talks resume with schools and pensions on the table",
        published_ago: "3h ago",
        read: "5m read",
        body: "<p>Nullam quis risus eget urna mollis ornare vel eu leo.</p>"
      }
    ]
    @featured_story = @app_stories.first
  end
end
