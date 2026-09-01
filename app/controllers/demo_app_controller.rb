# frozen_string_literal: true

class DemoAppController < ApplicationController
  include AppExperiment
  include AppPrototypeState
  include DemoWbezAppSampleData
  include DemoSuntimesAppSampleData

  layout "app"

  before_action :assign_brand_context
  before_action :assign_sample_stories
  before_action :assign_navigation

  def wbez
    render :wbez
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
    @app_tabs = [
      { id: "latest", label: "Latest", href: @app_brand == "suntimes" ? demo_app_suntimes_path : demo_app_wbez_path },
      { id: "listen", label: "Listen", href: "#" },
      { id: "saved", label: "Saved", href: "#" }
    ]
    @active_tab = "latest"
  end

  def find_story(stories, id)
    stories.find { |s| s[:id].to_s == id.to_s } || stories.first
  end

  def experiment_views_root
    "demo/app/#{@app_brand}/experiments"
  end
end
