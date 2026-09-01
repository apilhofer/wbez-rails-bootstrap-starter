# frozen_string_literal: true

class RssStoryImporter
  def initialize(feed)
    @feed = feed
  end

  def import!
    document = Nokogiri::XML(URI.open(@feed.url, open_timeout: 8, read_timeout: 20).read)
    document.xpath("//item").each do |item|
      upsert_item!(item)
    end
  end

  private

  def upsert_item!(item)
    guid = item.at_xpath("guid")&.text.presence || item.at_xpath("link")&.text
    return if guid.blank?

    story = Story.find_or_initialize_by(source: @feed.source, guid: guid)
    story.assign_attributes(
      feed: @feed,
      canonical_url: item.at_xpath("link")&.text,
      headline: item.at_xpath("title")&.text.to_s.strip,
      summary: item.at_xpath("description")&.text.to_s.strip.presence,
      body_html: item.at_xpath("*[local-name()='encoded']")&.text.presence || item.at_xpath("description")&.text,
      author_name: item.at_xpath("dc:creator")&.text.presence || item.at_xpath("author")&.text,
      published_at: parse_time(item.at_xpath("pubDate")&.text),
      section: item.at_xpath("category")&.text
    )
    story.save!
  end

  def parse_time(value)
    return nil if value.blank?

    Time.zone.parse(value)
  rescue ArgumentError
    nil
  end
end
