# frozen_string_literal: true

class Story < ApplicationRecord
  belongs_to :source
  belongs_to :feed, optional: true

  validates :guid, presence: true, uniqueness: { scope: :source_id }
  validates :headline, presence: true

  scope :published, -> { order(published_at: :desc) }

  def to_app_story
    {
      id: id.to_s,
      kicker: section,
      title: headline,
      dek: summary,
      published_ago: published_at ? time_ago_in_words(published_at) + " ago" : nil,
      read: estimated_read,
      body: body_html,
      audio_url: audio_url,
      image_url: image_url
    }
  end

  private

  def estimated_read
    words = body_html.to_s.gsub(/<[^>]+>/, " ").split.size
    minutes = [(words / 200.0).ceil, 1].max
    "#{minutes}m read"
  end

  def time_ago_in_words(time)
    seconds = Time.current - time
    minutes = (seconds / 60).floor
    return "#{minutes}m" if minutes < 60

    hours = (minutes / 60).floor
    "#{hours}h"
  end
end
