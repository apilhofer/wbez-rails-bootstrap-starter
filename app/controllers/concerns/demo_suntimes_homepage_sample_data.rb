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
  end
end
