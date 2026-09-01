# frozen_string_literal: true

module AppPrototypeState
  extend ActiveSupport::Concern

  READING_HISTORY_LIMIT = 10

  included do
    helper_method :saved_story_ids, :reading_history_ids
  end

  def remember_story_view(story_id)
    history = reading_history_ids
    history.delete(story_id.to_s)
    history.unshift(story_id.to_s)
    session[:app_reading_history] = history.first(READING_HISTORY_LIMIT)
  end

  def reading_history_ids
    Array(session[:app_reading_history]).map(&:to_s)
  end

  def saved_story_ids
    # Saved IDs are primarily client-side (localStorage). Controllers may mirror here if needed.
    Array(session[:app_saved_story_ids]).map(&:to_s)
  end
end
