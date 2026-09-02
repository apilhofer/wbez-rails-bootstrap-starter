# frozen_string_literal: true

class DemoAppController < ApplicationController
  include AppExperiment
  include AppPrototypeState
  include DemoWbezAppSampleData
  include DemoSuntimesAppSampleData
  include DemoWbezListenSampleData
  include DemoWbezBrowseSampleData
  include DemoWbezMenuSampleData
  include DemoCstHomeSampleData

  layout "app"

  before_action :assign_brand_context
  before_action :assign_listen_schedule, only: :wbez_listen
  before_action :assign_browse_content, only: :wbez_browse
  before_action :assign_menu_content, only: :wbez_menu
  before_action :assign_home_content, only: :suntimes_home
  before_action :assign_sample_stories, except: %i[wbez_listen wbez_browse wbez_menu suntimes_home wbez_experiments suntimes_experiments]
  before_action :assign_navigation

  def wbez_listen
    @app_brand = "wbez"
    @append_body_class = "wbez-app-prototype--listen"
    @active_tab = "radio"
    render :wbez_listen
  end

  def wbez_browse
    @app_brand = "wbez"
    @append_body_class = "wbez-app-prototype--browse"
    @active_tab = "browse"
    render :wbez_browse
  end

  def wbez_menu
    @app_brand = "wbez"
    @append_body_class = "wbez-app-prototype--menu"
    @menu_back_href = safe_wbez_menu_return_path(params[:return_to])
    render :wbez_menu
  end

  def wbez
    render :wbez
  end

  def suntimes_home
    @app_brand = "suntimes"
    @append_body_class = "suntimes-app-prototype--home"
    @active_tab = "top_news"
    render :suntimes_home
  end

  def suntimes
    render :suntimes
  end

  def wbez_story
    @story = find_story(@app_stories, params[:id])
    remember_story_view(@story[:id])
    render :story
  end

  def suntimes_story
    assign_suntimes_app_sample_stories unless @app_stories
    @story = find_story(@app_stories, params[:id])
    remember_story_view(@story[:id])
    render :story
  end

  def wbez_experiments
    render :experiments
  end

  def suntimes_experiments
    render :experiments
  end

  def switch_wbez_experiment
    set_experiment!(params[:experiment_id])
    redirect_to demo_app_wbez_path
  end

  def switch_suntimes_experiment
    set_experiment!(params[:experiment_id])
    redirect_to demo_app_suntimes_path
  end

  private

  def assign_brand_context
    @app_brand = action_name.include?("suntimes") ? "suntimes" : "wbez"
    self.class.app_experiment_key = @app_brand == "suntimes" ? "demo_app_suntimes" : "demo_app_wbez"
  end

  def assign_sample_stories
    @app_brand == "suntimes" ? assign_suntimes_app_sample_stories : assign_wbez_app_sample_stories
  end

  def assign_navigation
    if action_name.start_with?("wbez_listen", "wbez_browse", "wbez_menu")
      @app_tabs = [
        { id: "browse", label: "Browse", href: demo_app_wbez_browse_path, icon: "grid" },
        { id: "radio", label: "Radio", href: demo_app_wbez_listen_path, icon: "radio" },
        { id: "donate", label: "Donate", href: "#", icon: "heart" }
      ]
      @active_tab ||= "radio"
    elsif action_name == "suntimes_home"
      @app_tabs = [
        { id: "top_news", label: "Top News", href: demo_app_suntimes_home_path, icon: "top-news" },
        { id: "paper", label: "Today's Paper", href: "#", icon: "paper" },
        { id: "my_content", label: "My Content", href: "#", icon: "my-content" },
        { id: "search", label: "Search", href: "#", icon: "search" }
      ]
      @active_tab ||= "top_news"
    else
      @app_tabs = [
        { id: "latest", label: "Latest", href: @app_brand == "suntimes" ? demo_app_suntimes_path : demo_app_wbez_path },
        { id: "listen", label: "Listen", href: "#" },
        { id: "saved", label: "Saved", href: "#" }
      ]
      @active_tab = "latest"
    end
  end

  def find_story(stories, id)
    stories.find { |s| s[:id].to_s == id.to_s } || stories.first
  end

  def safe_wbez_menu_return_path(return_to)
    return demo_app_wbez_listen_path if return_to.blank?

    path = URI.parse(return_to.to_s).path
    return path if path.start_with?("/demo/app-wbez")

    demo_app_wbez_listen_path
  rescue URI::InvalidURIError
    demo_app_wbez_listen_path
  end

  def experiment_views_root
    "demo/app/#{@app_brand}/experiments"
  end
end
