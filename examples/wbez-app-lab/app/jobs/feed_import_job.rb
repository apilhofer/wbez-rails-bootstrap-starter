# frozen_string_literal: true

class FeedImportJob < ApplicationJob
  queue_as :default

  def perform(feed_id)
    feed = Feed.find(feed_id)
    RssStoryImporter.new(feed).import!
  end
end
