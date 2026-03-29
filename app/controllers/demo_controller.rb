class DemoController < ApplicationController
  include DemoSuntimesHomepageSampleData
  include DemoWbezSampleData

  before_action :assign_wbez_home_sample_data, only: :home
  before_action :assign_wbez_icons_sample_data, only: :icons
  before_action :assign_wbez_logos_sample_data, only: :logos
  before_action :assign_suntimes_homepage_sample_data, only: :cookbook_suntimes

  def index
    home_href =
      if Rails.application.routes.named_routes.key?(:root)
        Rails.application.routes.url_helpers.root_path
      else
        "/"
      end

    @breadcrumbs = [
      { label: "Home", href: home_href },
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
    render "demo/wbez/home"
  end

  def article
    render "demo/wbez/article"
  end

  def cookbook
    render "demo/wbez/cookbook"
  end

  def cookbook_suntimes
    render "demo/suntimes/cookbook_suntimes"
  end

  def style_guide_wbez
    render "demo/wbez/style_guide_wbez"
  end

  def style_guide_suntimes
    render "demo/suntimes/style_guide_suntimes"
  end

  def icons
    render "demo/wbez/icons"
  end

  def logos
    render "demo/wbez/logos"
  end
end
