# frozen_string_literal: true

# Sample instance variables for WBEZ demo pages. Replace with CMS/API in real apps.
module DemoWbezSampleData
  extend ActiveSupport::Concern

  private

  def assign_wbez_home_sample_data
    @lead_story = {
      kicker: "Latest",
      title: "Demo Home: Lorem ipsum dolor sit amet, consectetur adipiscing elit",
      dek: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    }

    # First story is the full-width featured rail item; next four fill a 2x2 column grid (left: 1+3, right: 2+4).
    @lead_rail_stories = [
      { kicker: "Architecture", title: "What's That Building? South portico of the Griffin Museum of Science and Industry", dek: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium.", featured: true },
      { kicker: "Theater & Stages", title: "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris" },
      { kicker: "City Hall", title: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum" },
      { kicker: "Environment", title: "Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia" },
      { kicker: "Museums & Zoos", title: "Mollit anim id est laborum sed ut perspiciatis unde omnis iste natus" }
    ]

    @education_stories = [
      { section: "Education", title: "Lorem ipsum dolor sit amet consectetuer adipiscing elit" },
      { section: "Education", title: "Aenean massa cum sociis natoque penatibus et magnis" },
      { section: "Education", title: "Donec quam felis ultricies nec pellentesque eu pretium" },
      { section: "Education", title: "In enim justo rhoncus ut imperdiet a venenatis vitae" }
    ]

    @featured_audio_items = [
      { kicker: "Classical", title: "Lorem ipsum story headline for audio slot one" },
      { kicker: "Education", title: "Ut enim ad minim veniam quis nostrud exercitation ullam" },
      { kicker: "Technology", title: "Duis aute irure dolor in reprehenderit in voluptate" },
      { kicker: "Theater & Stages", title: "Excepteur sint occaecat cupidatat non proident sunt" }
    ]

    @featured_audio = {
      show: "Featured Audio",
      episode: @featured_audio_items.first[:title],
      dek: "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.",
      duration: "24 min"
    }
    @featured_audio[:title] = @featured_audio[:show]
    @featured_audio[:program] = @featured_audio[:episode]
    @featured_audio[:description] = @featured_audio[:dek]

    @donation_inline = {
      title: "Accurate Information. Reliable Reporting. Diverse Perspectives.",
      button: "Donate"
    }

    @featured_breakout = {
      section: "Politics",
      title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit sed diam nonummy",
      dek: "Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat."
    }

    @featured_breakout_grid = [
      { title: "Duis autem vel eum iriure dolor in hendrerit in vulputate" },
      { title: "Nam liber tempor cum soluta nobis eleifend option congue" },
      { title: "Claritas est etiam processus dynamicus qui sequitur mutationem" },
      { title: "Investigationes demonstraverunt lectores legere me lius quod" }
    ]

    @featured_arts_lead = {
      section: "Theater & Stages",
      title: "Lorem ipsum dolor sit amet consectetuer adipiscing elit sed diam nonummy nibh euismod",
      dek: "Ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint."
    }

    @arts_culture_stories = [
      { section: "Arts & Culture", title: "At vero eos et accusamus et iusto odio dignissimos", dek: "Ducimus qui blanditiis praesentium voluptatum deleniti atque." },
      { section: "Music", title: "Et harum quidem rerum facilis est et expedita distinctio", dek: "Nam libero tempore cum soluta nobis est eligendi optio." },
      { section: "Arts & Culture", title: "Temporibus autem quibusdam et aut officiis debitis", dek: "Itaque earum rerum hic tenetur a sapiente delectus." }
    ]

    @rise_and_chi_stories = [
      { section: "Rise & Chi", title: "Neque porro quisquam est qui dolorem ipsum quia dolor", dek: "Sit amet consectetur adipisci velit sed quia non numquam." },
      { section: "Rise & Chi", title: "Quis autem vel eum iure reprehenderit qui in ea voluptate", dek: "Velit esse quam nihil molestiae consequatur vel illum." },
      { section: "Rise & Chi", title: "Duis autem vel eum iriure dolor in hendrerit in vulputate", dek: "Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit." },
      { section: "Rise & Chi", title: "Nam liber tempor cum soluta nobis eleifend option congue", dek: "Itaque earum rerum hic tenetur a sapiente delectus." }
    ]

    @news_feed_items = [
      { kicker: "Transportation", title: "Lorem ipsum dolor sit amet consectetur adipiscing elit sed", dek: "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur." },
      { kicker: "Parks & Nature", title: "Ut enim ad minima veniam quis nostrum exercitationem ullam", dek: "Excepteur sint occaecat cupidatat non proident sunt in culpa qui officia deserunt mollit anim id est laborum." },
      { kicker: "Elections", title: "Quis autem vel eum iure reprehenderit qui in ea voluptate", dek: "At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum." },
      { kicker: "Religion", title: "At vero eos et accusamus et iusto odio dignissimos ducimus", dek: "Deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident." },
      { kicker: "Springfield", title: "Nam libero tempore cum soluta nobis est eligendi optio", dek: "Similique sunt in culpa qui officia deserunt mollitia animi id est laborum et dolorum fuga." },
      { kicker: "City Hall", title: "Temporibus autem quibusdam et aut officiis debitis aut rerum", dek: "Et harum quidem rerum facilis est et expedita distinctio nam libero tempore cum soluta nobis." },
      { kicker: "Education", title: "Itaque earum rerum hic tenetur a sapiente delectus ut aut", dek: "Reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat." },
      { kicker: "Music", title: "On the record: lorem ipsum placeholder headline for feed", dek: "Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit sed quia consequuntur magni." },
      { kicker: "Courts", title: "Sed ut perspiciatis unde omnis iste natus error sit voluptatem", dek: "Accusantium doloremque laudantium totam rem aperiam eaque ipsa quae ab illo inventore veritatis." },
      { kicker: "Health", title: "Nemo enim ipsam voluptatem quia voluptas aspernatur aut odit", dek: "Ut enim ad minima veniam quis nostrum exercitationem ullam corporis suscipit laboriosam nisi." },
      { kicker: "Housing", title: "Aliquam lorem ante dapibus in viverra quis feugiat a tellus", dek: "Phasellus viverra nulla ut metus varius laoreet quisque rutrum aenean imperdiet." },
      { kicker: "Arts", title: "Etiam ultricies nisi vel augue curabitur ullamcorper ultricies nisi", dek: "Nam eget dui etiam rhoncus maecenas tempus tellus eget condimentum rhoncus." },
      { kicker: "Environment", title: "Vestibulum ante ipsum primis in faucibus orci luctus et ultrices", dek: "Posuere cubilia curae fusce id purus ut varius tincidunt libero non metus." },
      { kicker: "Business", title: "Integer tincidunt cras dapibus vivamus elementum semper nisi aenean", dek: "Vulputate eleifend tellus aenean leo ligula porttitor eu consequat vitae eleifend ac." },
      { kicker: "Science", title: "Curabitur ullamcorper ultricies nisi nam eget dui etiam rhoncus", dek: "Maecenas tempus tellus eget condimentum rhoncus sem quam semper libero sit amet." }
    ]
    @more_news_items = @news_feed_items.map { |item| item[:title] }

    @full_width_promo_spot = {
      graphic_line1: "You count on WBEZ",
      graphic_line2: "And WBEZ counts on you",
      title: "WBEZ is member-funded",
      body: "WBEZ is here for you today thanks to a strong legacy of listener support. New members are needed now to continue and strengthen this important work. The more listeners who choose to join, the greater the impact of this indispensable service. Every donation matters. Every person counts.",
      button: "Donate now",
      href: "#"
    }

    @curious_city_feature = {
      title: "Lorem ipsum: curabitur blandit tempus porttitor dolor sit amet?"
    }

    @whats_that_building_feature = {
      title: "What's That Building? South portico of the Griffin Museum of Science and Industry"
    }

    @one_column_event_list_items = [
      { title: "Wait Wait... Don't Tell Me!", date: "Ongoing throughout the year" },
      { title: "WBEZ Presents: An Evening with Ani DiFranco", date: "March 27" },
      { title: "SOLD OUT - WBEZ Presents: An Evening with Cory Booker", date: "March 29" },
      { title: "WBEZ Presents: An Evening with Patrick Radden Keefe and Gillian Flynn", date: "April 16" },
      { title: "WBEZ Presents: Tent Talks at Evanston Folk Festival", date: "Sept 12-13" }
    ]

    @one_column_top_list_items = [
      { title: "Obama Presidential Center: what neighbors and the city are asking this month" },
      { title: "The confusing world of super PACs in Illinois, explained in plain language" },
      { title: "Lollapalooza 2026: what we know about tickets, lineup timing, and Grant Park" },
      { title: "Chicago Public Schools enrollment: five charts that show where things stand" },
      { title: "CTA bus reliability: riders report longer waits on these key corridors" },
      { title: "City Council preview: housing, budget, and a contested vote on development" },
      { title: "Weekend weather: when the warm spell breaks and what to expect" }
    ]
  end

  def assign_wbez_icons_sample_data
    @wbez_icons = [
      ["cursor", "icons/wbez/cursor.svg"],
      ["envelope", "icons/wbez/envelope.svg"],
      ["external-link", "icons/wbez/external-link.svg"],
      ["facebook", "icons/wbez/facebook.svg"],
      ["feedburner", "icons/wbez/feedburner.svg"],
      ["heart", "icons/wbez/heart.svg"],
      ["instagram", "icons/wbez/instagram.svg"],
      ["jump-back", "icons/wbez/jump-back.svg"],
      ["jump-forward", "icons/wbez/jump-forward.svg"],
      ["link", "icons/wbez/link.svg"],
      ["menu", "icons/wbez/menu.svg"],
      ["microphone", "icons/wbez/microphone.svg"],
      ["news", "icons/wbez/news.svg"],
      ["pause", "icons/wbez/pause.svg"],
      ["pdf", "icons/wbez/pdf.svg"],
      ["play", "icons/wbez/play.svg"],
      ["plus", "icons/wbez/plus.svg"],
      ["rss", "icons/wbez/rss.svg"],
      ["search", "icons/wbez/search.svg"],
      ["skip-back", "icons/wbez/skip-back.svg"],
      ["skip-forward", "icons/wbez/skip-forward.svg"],
      ["stop", "icons/wbez/stop.svg"],
      ["times", "icons/wbez/times.svg"],
      ["twitter", "icons/wbez/twitter.svg"],
      ["youtube", "icons/wbez/youtube.svg"]
    ]

    @marketing_icons = [
      ["envelope", "icons/marketing/envelope.svg"],
      ["heart", "icons/marketing/heart.svg"],
      ["microphone", "icons/marketing/microphone.svg"],
      ["news", "icons/marketing/news.svg"],
      ["noun_Donate_1573191", "icons/marketing/noun_Donate_1573191.svg"],
      ["noun_Donate_3147033", "icons/marketing/noun_Donate_3147033.svg"],
      ["noun_Email_2467656", "icons/marketing/noun_Email_2467656.svg"],
      ["noun_Email_2516395", "icons/marketing/noun_Email_2516395.svg"],
      ["noun_Email_2594824", "icons/marketing/noun_Email_2594824.svg"],
      ["noun_Email_3168904", "icons/marketing/noun_Email_3168904.svg"],
      ["noun_Email_835198", "icons/marketing/noun_Email_835198.svg"],
      ["noun_Gift_2372425", "icons/marketing/noun_Gift_2372425.svg"],
      ["noun_Inbox_2616468", "icons/marketing/noun_Inbox_2616468.svg"],
      ["noun_Love_2558811", "icons/marketing/noun_Love_2558811.svg"],
      ["noun_member_2397665", "icons/marketing/noun_member_2397665.svg"],
      ["noun_news_1993178", "icons/marketing/noun_news_1993178.svg"],
      ["noun_news_3168925", "icons/marketing/noun_news_3168925.svg"],
      ["noun_news_847428", "icons/marketing/noun_news_847428.svg"],
      ["noun_support_3105757", "icons/marketing/noun_support_3105757.svg"]
    ]
  end

  def assign_wbez_logos_sample_data
    @logos = [
      ["WBEZ Standard Logo (Brightspot)", "logos/wbez-standard-logo.svg"],
      ["Chicago Public Media", "logos/cpm-logo.png"],
      ["Vocalo Oneline", "logos/vocalo-logo-oneline.svg"],
      ["Vocalo Stacked", "logos/vocalo-logo-stacked.svg"],
      ["WBEZ 91.5 Oneline Light", "logos/wbez-915-chicago-logo-oneline--light.svg"],
      ["WBEZ 91.5 Oneline", "logos/wbez-915-chicago-logo-oneline.svg"],
      ["WBEZ 91.5 Stacked", "logos/wbez-915-chicago-logo-stacked.svg"],
      ["WBEZ Chicago Oneline Dark Theme", "logos/wbez-chicago-logo-oneline--dark-theme.svg"],
      ["WBEZ Chicago Oneline", "logos/wbez-chicago-logo-oneline.svg"],
      ["WBEZ Chicago Tagline Dark Theme", "logos/wbez-chicago-logo-tagline--dark-theme.svg"],
      ["WBEZ Chicago Tagline", "logos/wbez-chicago-logo-tagline.svg"],
      ["WBEZ Rundown", "logos/wbez-rundown-logo.svg"],
      ["WBEZ Square", "logos/wbez-square.svg"]
    ]
  end
end
