class DemoController < ApplicationController
  def index
    @breadcrumbs = [
      { label: "Home", href: root_path },
      { label: "Demo" }
    ]

    @current_tab = (params[:tab] || "overview").to_sym
    @current_page = [(params[:page] || 1).to_i, 1].max
    @per_page = 4

    @tabs = [
      { key: :overview, label: "Overview", href: demo_path(tab: "overview", page: 1) },
      { key: :table, label: "Table", href: demo_path(tab: "table", page: 1) },
      { key: :form, label: "Form", href: demo_path(tab: "form", page: 1) }
    ]

    @table_headers = ["Program", "Status", "Owner", "Updated"]

    all_rows = [
      ["Morning Edition", "Live", "Newsroom", "Today"],
      ["Reset", "Draft", "Product", "Yesterday"],
      ["Membership Drive", "Scheduled", "Revenue", "Mar 17"],
      ["Events", "Published", "Audience", "Mar 16"],
      ["City Hall", "Editing", "Politics", "Mar 15"],
      ["Investigations", "Review", "Investigations", "Mar 14"],
      ["Weekend Shows", "Queued", "Programming", "Mar 13"],
      ["Podcast Cutdown", "Published", "Audio", "Mar 12"],
      ["Election Guide", "Live", "Politics", "Mar 11"],
      ["Spring Fundraiser", "Scheduled", "Membership", "Mar 10"]
    ]

    @total_pages = (all_rows.size.to_f / @per_page).ceil
    @current_page = [@current_page, @total_pages].min
    start_index = (@current_page - 1) * @per_page
    @table_rows = all_rows.slice(start_index, @per_page) || []
  end

  def home
    @lead_story = {
      kicker: "Latest News",
      title: "City Hall, schools and the spring election dominate the week in Chicago",
      dek: "A homepage-style demo that uses Bootstrap layout with WBEZ-inspired editorial structure."
    }

    @secondary_stories = [
      { kicker: "Arts & Culture", title: "A new wave of neighborhood venues is changing where Chicago hears music" },
      { kicker: "Curious City", title: "Why are Chicago alleyways laid out the way they are?" },
      { kicker: "Politics", title: "What the next budget fight means for transit riders" }
    ]
  end

  def article
  end

  def cookbook
  end

  def icons
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

  def logos
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
