# frozen_string_literal: true

module AppExperiment
  extend ActiveSupport::Concern

  included do
    helper_method :current_experiment, :available_experiments, :experiment_partial_path, :render_experiment_partial
  end

  class_methods do
    attr_accessor :app_experiment_key

    def app_experiments(key)
      self.app_experiment_key = key
    end
  end

  def current_experiment
    @current_experiment ||= begin
      requested = params[:experiment].presence || session[experiment_session_key]
      valid = available_experiments.map { |e| e[:id].to_s }
      valid.include?(requested.to_s) ? requested.to_s : default_experiment_id
    end
  end

  def set_experiment!(experiment_id)
    valid = available_experiments.map { |e| e[:id].to_s }
    return false unless valid.include?(experiment_id.to_s)

    session[experiment_session_key] = experiment_id.to_s
    @current_experiment = experiment_id.to_s
    true
  end

  def available_experiments
    @available_experiments ||= load_experiment_registry
  end

  def experiment_partial_path(partial_name)
    "#{experiment_views_root}/#{current_experiment}/#{partial_name}"
  end

  def render_experiment_partial(partial_name, locals = {})
    render partial: experiment_partial_path(partial_name), locals: locals
  end

  private

  def experiment_session_key
    :"app_experiment_#{self.class.app_experiment_key || controller_name}"
  end

  def experiment_views_root
    "app/experiments"
  end

  def default_experiment_id
    available_experiments.first&.dig(:id).to_s.presence || "baseline"
  end

  def load_experiment_registry
    path = Rails.root.join("config/app_prototype.yml")
    return default_registry unless path.exist?

    yaml = YAML.load_file(path) || {}
    key = self.class.app_experiment_key || controller_name
    list = yaml.dig("apps", key.to_s, "experiments") || yaml.dig(key.to_s, "experiments")
    return default_registry unless list.is_a?(Array) && list.any?

    list.map(&:symbolize_keys)
  end

  def default_registry
    [
      { id: "baseline", label: "Baseline", description: "Default app river density." },
      { id: "dense_river", label: "Dense river", description: "Smaller thumbnails and tighter rows." }
    ]
  end
end
