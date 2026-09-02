# frozen_string_literal: true

module DemoCstHomeSampleData
  extend ActiveSupport::Concern

  private

  def assign_home_content
    @section_tabs = [
      { id: "home", label: "Home", active: true },
      { id: "news", label: "News" },
      { id: "sports", label: "Sports" },
      { id: "politics", label: "Politics" },
      { id: "commentary", label: "Commentary" },
      { id: "life", label: "Life" }
    ]

    @filter_label = "All"

    @hero_story = {
      id: "1",
      title: "Washington Park mass shooting was 'somewhat targeted,' likely involved gunfight, Chicago top cop says",
      date: "09/01/2026",
      artwork_bg: "linear-gradient(180deg, rgba(0,0,0,0.05) 0%, rgba(0,0,0,0.82) 100%), linear-gradient(135deg, #5a4a42 0%, #2a2420 55%, #1a1614 100%)"
    }

    @grid_stories = [
      {
        id: "2",
        title: "Failed inspections, no consequences: Chicago's lax oversight of lead paint hazards",
        date: "09/01/2026",
        artwork_bg: "linear-gradient(135deg, #8b7355 0%, #4a3f35 100%)"
      },
      {
        id: "3",
        title: "Jim Ruddle, Chicago TV news anchor and radio host, dies at 80",
        date: "09/01/2026",
        artwork_bg: "linear-gradient(135deg, #4a6fa5 0%, #2d4a6b 100%)"
      }
    ]

    @list_stories = [
      {
        id: "4",
        title: "Heir to a revolutionary past, playwright and author Zayd Ayers Dohrn finds his own voice",
        date: "09/01/2026",
        artwork_bg: "linear-gradient(135deg, #6b7280 0%, #374151 100%)"
      },
      {
        id: "5",
        title: "'Goofy' is gone as Bears coach Ben Johnson sees sharper focus from QB Caleb Williams",
        date: "09/01/2026",
        artwork_bg: "linear-gradient(135deg, #1e3a5f 0%, #0f172a 100%)"
      },
      {
        id: "6",
        title: "Lawsuit: CTA showed reckless disregard in the death of Dominique Brown, attorneys say",
        date: "09/01/2026",
        artwork_bg: "linear-gradient(135deg, #2563eb 0%, #1e40af 100%)"
      }
    ]
  end
end
