# frozen_string_literal: true

# Sample instance variables for Sun-Times homepage / cookbook demos. Replace with CMS/API in real apps.
# Story meta uses :published_ago + :read (no byline), or :author_name + :read (byline links to @author_href).
module DemoSuntimesHomepageSampleData
  extend ActiveSupport::Concern

  private

  def assign_suntimes_homepage_sample_data
    @story_href = "#"
    @author_href = "#" # placeholder until author pages exist

    @hero_left = [
      { section: "Chicago School Board", title: "CPS Board selects Macquline King as permanent CEO, will vote on her contract Monday", author_name: "Sarah Karp", read: "3m read" },
      { section: "Chicago", title: "With Bears in mind, Sanders bill would offer up sports teams to city", author_name: "Tina Sfondeles", read: "3m read" },
      { section: "News", title: "Funeral for Chicago firefighter killed in Rogers Park blaze canceled", published_ago: "28m ago", read: "1m read", divider: false }
    ]

    @hero_center_lead = {
      section: "Donald Trump",
      title: "Ex-federal prosecutors in Chicago taking on Trump's 'troubling' DOJ",
      dek: "An email from former prosecutors seeks broad support following Justice Department controversies.",
      author_name: "Jon Seidel",
      read: "4m read"
    }

    @hero_center_sub = [
      { section: "News", title: "On Opening Day, some Cubs fans lean into sports betting boom while others remain wary", author_name: "Nader Issa", read: "3m read" },
      { section: "Crime", title: "49th Ward office closes temporarily after violent threats following killing", author_name: "Mohammad Samra", read: "3m read" }
    ]

    @latest_rail_items = [
      { section: "Work", title: "Mayor Johnson's veto over freezing tipped minimum wage divides restaurant industry", published_ago: "19m ago", read: "4m read" },
      { section: "Brandon Johnson", title: "Johnson devising strategy to tackle pension crisis", published_ago: "55m ago", read: "4m read" },
      { section: "White Sox", title: "Whether White Sox can take a real step forward in 2026", published_ago: "31m ago", read: "5m read" }
    ]
    @latest_crossword = { title: "The Chicago Mini Crossword", dek: "Only real wieners will get this one." }

    @chicago = {
      lead: {
        section: "Immigration",
        title: "Tracking every known federal prosecution in Chicago tied to deportation blitz",
        dek: "Immigration agents have been helping with security at O’Hare International Airport, where activists gathered to protest federal enforcement.",
        published_ago: "5h ago",
        read: "1m read"
      },
      stack: [
        { section: "Architecture and Design", title: "Work starts on landmark Pullman church restoration", published_ago: "6h ago", read: "3m read" },
        { section: "Morning Edition", title: "A West Suburban Medical emergency", published_ago: "8h ago", read: "7m read" },
        { section: "Music", title: "The Academy Is... releases first new album in 18 years", published_ago: "11h ago", read: "4m read", listen: true, divider: false }
      ],
      rail: {
        section: "Money",
        title: "Mars Snacking, maker of M&M's, plans to add 600 jobs in Chicago",
        dek: "The company said it would also invest $100 million to expand its global headquarters.",
        published_ago: "1h ago",
        read: "3m read"
      }
    }

    @commentary = {
      title: "Commentary",
      intro: "The opinions in and around Chicago that inform, analyze, hold power accountable and entertain.",
      read_more_href: "#",
      columnists: [
        { name: "Natalie Y. Moore", title: "AIPAC has become a political liability for many seeking office" },
        { name: "Neil Steinberg", title: "Americans, once ‘suffocated by smog, poisoned by water,’ face return to bad old days" }
      ]
    }

    @investigations = [
      { section: "Elections", title: "Cook County Assessor Fritz Kaegi lost big where property taxes in city, suburbs soared" },
      { section: "The Watchdogs", title: "Brandon Johnson's budget director got illegal property tax breaks for 5 years" }
    ]

    @news_politics = {
      lead: {
        section: "Health",
        title: "West Suburban Medical Center closing temporarily as it runs out of cash to pay employees",
        dek: "The hospital said it would stop accepting new patients and transfer existing ones as it seeks bridge funding.",
        published_ago: "23h ago",
        read: "4m read"
      },
      stack: [
        { section: "Springfield", title: "Foundation's role a mystery as Lincoln artifacts are poised to be auctioned off", published_ago: "23h ago", read: "4m read" },
        { section: "Immigration", title: "State lawmakers advance bill to keep immigration detention centers out of communities like suburban Broadview", published_ago: "23h ago", read: "2m read" },
        { section: "Business", title: "What to know about Chicago's delivery robots and the debate over them", published_ago: "23h ago", read: "7m read", divider: false }
      ],
      watchdog: {
        section: "The Watchdogs",
        title: "Inside Medicare Advantage ‘dark money’ group’s campaign to win bigger payments to insurers",
        dek: "Most of 16,000-plus comments posted by the federal government asking it to raise payments to insurance companies are identical to a letter on the website of a secretive advocacy group called Medicare Advantage Majority, KFF Health News found.",
        published_ago: "11h ago",
        read: "6m read"
      }
    }

    @public_safety = [
      {
        image: true,
        section: "Crime",
        title: "Humboldt Park shooting leaves man, 26, critically injured",
        published_ago: "1h ago",
        read: "1m read",
        wide_image: true
      },
      { section: "Crime", title: "Man shot last year in Roseland dies", published_ago: "2h ago", read: "1m read" },
      { section: "Crime", title: "Boy, 17, critically wounded in Back of the Yards shooting", published_ago: "3h ago", read: "1m read" },
      { section: "Crime", title: "2 men charged with murder of businessman involved in United Center development project", published_ago: "5h ago", read: "2m read", divider: false }
    ]

    @arts = {
      lead: {
        section: "Chicago",
        title: "More César Chavez murals, memorials taken down as Illinois Senate honors Dolores Huerta",
        dek: "The removals follow a wave of reevaluations of public art tied to labor history and representation.",
        published_ago: "22h ago",
        read: "3m read"
      },
      stack: [
        { section: "Arts and Culture", title: "Route 66 centennial celebrated with new sign at Navy Pier", published_ago: "22h ago", read: "2m read" },
        { section: "Things To Do", title: "19 things to do in Chicago March 26-April 1", published_ago: "23h ago", read: "5m read" },
        { section: "Food and Drink", title: "What are Chicago’s favorite craft beers? We asked, and you answered.", published_ago: "Mar 25, 2026", read: "4m read", divider: false }
      ],
      rail: {
        section: "Theater and Stages",
        title: "Congo Square ensemble members say in letter that the prominent Black theater was quietly dissolved",
        dek: "An open letter on Facebook lays bare two contentious years that ensemble members say resulted in the end of a storied Chicago arts group.",
        published_ago: "11h ago",
        read: "3m read"
      }
    }

    @sports = {
      lead: {
        section: "White Sox",
        title: "Jedixson Paez goes from High-A to Opening Day in White Sox' bullpen",
        dek: "The reliever’s rapid rise capped a spring in which the Sox leaned on young arms to fill late innings.",
        published_ago: "2h ago",
        read: "3m read"
      },
      stack: [
        { section: "Sky", title: "Sky’s free-agency path runs through the next tier, not the stars", published_ago: "3h ago", read: "4m read" },
        { section: "Bulls", title: "Bulls' Josh Giddey hopes team can avoid splintering down the stretch", published_ago: "8h ago", read: "3m read" },
        { section: "Bears", title: "George Gervin on Bears' Caleb Williams: 'Iceman' nickname already taken", published_ago: "10h ago", read: "3m read", divider: false }
      ],
      rail: {
        section: "Blackhawks",
        title: "Jeff Blashill trying to help Blackhawks navigate lack of practice time",
        dek: "The Hawks have only had two opportunities to practice since the March 6 trade deadline, including zero since March 16, because of a jam-packed schedule.",
        published_ago: "2h ago",
        read: "3m read"
      }
    }

    @newsletter = {
      title: "Morning Edition",
      dek: "Start your day informed. Don’t miss our award-winning local newsletter in your inbox each morning."
    }

    @paying_your_taxes = [
      { section: "Property Taxes", title: "How to appeal your Cook County property tax assessment before the deadline" },
      { section: "Explainers", title: "Where your Chicago property tax bill goes and who decides the split" },
      { section: "Springfield", title: "State lawmakers debate new relief options for homeowners facing reassessments" },
      { section: "Personal Finance", title: "Tax prep checklist: credits and records to gather before you file" }
    ]

    @bears = {
      lead: {
        section: "Bears",
        title: "Bears reset expectations as camp opens with a new coordinator",
        dek: "Chicago's offseason priorities shift from roster churn to consistency and development.",
        published_ago: "2h ago",
        read: "4m read"
      },
      stack: [
        { section: "Bears", title: "What we learned from the first depth-chart look", published_ago: "3h ago", read: "3m read" },
        { section: "Bears", title: "How the offensive line battle could shape Week 1", published_ago: "5h ago", read: "4m read" },
        { section: "Bears", title: "Rookie reps increase as coaches evaluate versatility", published_ago: "8h ago", read: "2m read", divider: false }
      ]
    }

    @bulls = [
      { section: "Bulls", title: "Bulls' backcourt chemistry remains the biggest swing factor", published_ago: "1h ago", read: "3m read", image: true, wide_image: true },
      { section: "Bulls", title: "Front office signals patience ahead of trade deadline", published_ago: "4h ago", read: "2m read" },
      { section: "Bulls", title: "Three lineup tweaks coaches keep testing in practice", published_ago: "7h ago", read: "3m read", divider: false }
    ]

    @bottom_four_rails = [
      {
        title: "Horoscopes & Dear Abby",
        items: [
          { section: "Horoscopes", title: "Your daily horoscope: what Thursday has in store", published_ago: "1h ago", read: "2m read", image: true, wide_image: true },
          { section: "Dear Abby", title: "Dear Abby: Navigating a friendship after a major fallout", published_ago: "3h ago", read: "2m read" },
          { section: "Advice", title: "What etiquette experts say about splitting wedding travel costs", published_ago: "6h ago", read: "3m read", divider: false }
        ]
      },
      {
        title: "Environment",
        items: [
          { section: "Environment", title: "Lakefront restoration project enters final review phase", published_ago: "2h ago", read: "3m read", image: true, wide_image: true },
          { section: "Climate", title: "How warmer winters are changing migration patterns in Illinois", published_ago: "5h ago", read: "4m read" },
          { section: "Policy", title: "City council weighs stricter emissions targets for municipal fleets", published_ago: "9h ago", read: "3m read", divider: false }
        ]
      },
      {
        title: "Outdoors",
        items: [
          { section: "Outdoors", title: "Best spring trail loops within 90 minutes of Chicago", published_ago: "1h ago", read: "4m read", image: true, wide_image: true },
          { section: "Recreation", title: "Forest preserve volunteer days open for April signups", published_ago: "4h ago", read: "2m read" },
          { section: "Parks", title: "What to know before kayaking the Chicago River this season", published_ago: "8h ago", read: "3m read", divider: false }
        ]
      },
      {
        title: "Money and Taste",
        items: [
          { section: "Money and Taste", title: "How rising ingredient costs are reshaping neighborhood menus", published_ago: "2h ago", read: "3m read", image: true, wide_image: true },
          { section: "Restaurants", title: "Five standout prix-fixe deals to try this month", published_ago: "5h ago", read: "3m read" },
          { section: "Budgets", title: "Stretching your grocery budget without sacrificing quality", published_ago: "7h ago", read: "3m read", divider: false }
        ]
      }
    ]

    @sports_four_rails = [
      {
        title: "High School Sports",
        items: [
          { section: "High School Sports", title: "City championship brackets tighten after semifinal upsets", published_ago: "1h ago", read: "3m read", image: true, wide_image: true },
          { section: "Prep Baseball", title: "Scouts highlight five breakout arms to watch this spring", published_ago: "3h ago", read: "2m read" },
          { section: "Prep Basketball", title: "Why transfer rules are shaping next season's contender map", published_ago: "6h ago", read: "3m read", divider: false }
        ]
      },
      {
        title: "College Sports",
        items: [
          { section: "College Sports", title: "Big Ten spring storylines: quarterback races and portal moves", published_ago: "2h ago", read: "4m read", image: true, wide_image: true },
          { section: "NCAA", title: "How NIL collectives are changing recruiting timelines", published_ago: "4h ago", read: "3m read" },
          { section: "DePaul", title: "Program reset continues with defensive-first roster tweaks", published_ago: "7h ago", read: "2m read", divider: false }
        ]
      },
      {
        title: "Bulls",
        items: [
          { section: "Bulls", title: "Bulls' backcourt chemistry remains the biggest swing factor", published_ago: "1h ago", read: "3m read", image: true, wide_image: true },
          { section: "Bulls", title: "Front office signals patience ahead of trade deadline", published_ago: "4h ago", read: "2m read" },
          { section: "Bulls", title: "Three lineup tweaks coaches keep testing in practice", published_ago: "7h ago", read: "3m read", divider: false }
        ]
      },
      {
        title: "Blackhawks",
        items: [
          { section: "Blackhawks", title: "Line combinations shift as coaches search for consistency", published_ago: "2h ago", read: "3m read", image: true, wide_image: true },
          { section: "Blackhawks", title: "Prospect call-ups add speed to the middle six", published_ago: "5h ago", read: "2m read" },
          { section: "Blackhawks", title: "Special teams adjustments become late-season priority", published_ago: "8h ago", read: "3m read", divider: false }
        ]
      }
    ]

    @news_regions_four_rails = [
      {
        title: "Nation & World",
        items: [
          { section: "Nation & World", title: "Global markets steady as central banks signal slower rate cuts", published_ago: "1h ago", read: "3m read", image: true, wide_image: true },
          { section: "Nation", title: "Congress weighs bipartisan package on rail safety standards", published_ago: "3h ago", read: "2m read" },
          { section: "World", title: "Aid corridors expand after cease-fire monitoring agreement", published_ago: "6h ago", read: "3m read", divider: false }
        ]
      },
      {
        title: "Illinois",
        items: [
          { section: "Illinois", title: "State agency proposes timeline for clean-energy permitting updates", published_ago: "2h ago", read: "4m read", image: true, wide_image: true },
          { section: "Springfield", title: "Budget negotiators narrow gaps ahead of committee vote", published_ago: "4h ago", read: "3m read" },
          { section: "Downstate", title: "Rural hospital network expands telehealth footprint", published_ago: "7h ago", read: "2m read", divider: false }
        ]
      },
      {
        title: "Chicago Suburbs",
        items: [
          { section: "Chicago Suburbs", title: "Metra-adjacent zoning plans spark debate in west suburban council", published_ago: "1h ago", read: "3m read", image: true, wide_image: true },
          { section: "Transportation", title: "Pace route redesign aims to improve cross-county service", published_ago: "5h ago", read: "2m read" },
          { section: "Development", title: "Mixed-use project approved near suburban town center", published_ago: "8h ago", read: "3m read", divider: false }
        ]
      },
      {
        title: "Education",
        items: [
          { section: "Education", title: "District leaders outline tutoring expansion for fall semester", published_ago: "2h ago", read: "3m read", image: true, wide_image: true },
          { section: "Higher Ed", title: "Community colleges see rebound in adult learner enrollment", published_ago: "4h ago", read: "2m read" },
          { section: "Schools", title: "What families should know about selective enrollment deadlines", published_ago: "9h ago", read: "3m read", divider: false }
        ]
      }
    ]

    @opinion_four_rails = [
      {
        title: "Columnists",
        items: [
          { section: "Columnists", title: "Why neighborhood-level reporting still matters in city politics", published_ago: "1h ago", read: "3m read", image: true, wide_image: true },
          { section: "Opinion", title: "The transit funding cliff is closer than riders think", published_ago: "3h ago", read: "2m read" },
          { section: "Commentary", title: "What civic trust looks like after budget season", published_ago: "6h ago", read: "3m read", divider: false }
        ]
      },
      {
        title: "Other Views",
        items: [
          { section: "Other Views", title: "Business leaders call for clearer housing production targets", published_ago: "2h ago", read: "3m read", image: true, wide_image: true },
          { section: "Guest Essay", title: "Investing in youth programs reduces long-term public costs", published_ago: "4h ago", read: "2m read" },
          { section: "Perspective", title: "A suburban mayor on balancing growth and affordability", published_ago: "7h ago", read: "3m read", divider: false }
        ]
      },
      {
        title: "Letters to the Editor",
        items: [
          { section: "Letters to the Editor", title: "Readers respond to coverage of school funding inequities", published_ago: "1h ago", read: "2m read", image: true, wide_image: true },
          { section: "Letters", title: "What commuters say about proposed congestion pricing", published_ago: "5h ago", read: "2m read" },
          { section: "Reader Mail", title: "Chicagoans debate the future of downtown office space", published_ago: "8h ago", read: "3m read", divider: false }
        ]
      },
      {
        title: "News",
        items: [
          { section: "News", title: "Editors' picks: five stories shaping this week across the metro area", published_ago: "2h ago", read: "3m read", image: true, wide_image: true },
          { section: "Updates", title: "What we’re watching in Springfield and City Hall today", published_ago: "4h ago", read: "2m read" },
          { section: "Briefing", title: "Morning briefing: transit, weather, and public safety notes", published_ago: "9h ago", read: "3m read", divider: false }
        ]
      }
    ]

    @listen_to_wbez = {
      lead: {
        section: "WBEZ",
        title: "What to know this week across Chicago politics, culture, and public media",
        dek: "Listen live and catch up on essential reporting, interviews, and explainers from the WBEZ newsroom.",
        published_ago: "1h ago",
        read: "4m read"
      },
      stack: [
        { section: "Morning Edition", title: "Start your day with the top local headlines and context", published_ago: "2h ago", read: "3m read" },
        { section: "Reset", title: "A closer look at the week’s biggest stories and what comes next", published_ago: "4h ago", read: "3m read" },
        { section: "City Cast", title: "Neighborhood voices on transit, schools, and affordability", published_ago: "7h ago", read: "3m read", divider: false }
      ]
    }
  end
end
