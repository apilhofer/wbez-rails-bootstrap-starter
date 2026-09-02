# frozen_string_literal: true

module DemoSuntimesAppSampleData
  extend ActiveSupport::Concern

  def assign_suntimes_app_sample_stories
    @app_stories = [
      {
        id: "1",
        kicker: "News",
        title: "Washington Park mass shooting was 'somewhat targeted,' likely involved gunfight, Chicago top cop says",
        dek: "Police said the investigation is ongoing as community leaders call for action.",
        published_ago: "45m ago",
        read: "3m read",
        body: "<p class=\"lead\">Chicago's top police official described the Washington Park shooting as likely involving an exchange of gunfire between groups.</p><p>Investigators are reviewing surveillance footage and interviewing witnesses.</p>",
        author_name: "By Staff Report"
      },
      {
        id: "2",
        kicker: "Investigation",
        title: "Failed inspections, no consequences: Chicago's lax oversight of lead paint hazards",
        published_ago: "2h ago",
        read: "4m read",
        body: "<p>A Sun-Times review found gaps in enforcement despite repeated violations.</p>",
        author_name: "By Staff Report"
      },
      {
        id: "3",
        kicker: "Obituary",
        title: "Jim Ruddle, Chicago TV news anchor and radio host, dies at 80",
        published_ago: "3h ago",
        read: "2m read",
        body: "<p>Ruddle was a familiar voice on Chicago airwaves for decades.</p>",
        author_name: "By Staff Report"
      },
      {
        id: "4",
        kicker: "Culture",
        title: "Heir to a revolutionary past, playwright and author Zayd Ayers Dohrn finds his own voice",
        published_ago: "4h ago",
        read: "5m read",
        body: "<p>Dohrn's new work draws on family history while carving out a distinct artistic identity.</p>",
        author_name: "By Staff Report"
      },
      {
        id: "5",
        kicker: "Sports",
        title: "'Goofy' is gone as Bears coach Ben Johnson sees sharper focus from QB Caleb Williams",
        published_ago: "5h ago",
        read: "3m read",
        body: "<p>Johnson said the quarterback has shown improved decision-making in recent practices.</p>",
        author_name: "By Sports Desk"
      },
      {
        id: "6",
        kicker: "News",
        title: "Lawsuit: CTA showed reckless disregard in the death of Dominique Brown, attorneys say",
        published_ago: "6h ago",
        read: "4m read",
        body: "<p>Attorneys for the family filed suit alleging systemic safety failures.</p>",
        author_name: "By Staff Report"
      }
    ]
    @featured_story = @app_stories.first
  end
end
