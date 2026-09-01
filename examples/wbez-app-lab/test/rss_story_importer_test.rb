# frozen_string_literal: true

require "minitest/autorun"
require "nokogiri"

class RssStoryImporterTest < Minitest::Test
  FIXTURE = File.join(File.dirname(__FILE__), "fixtures", "sample_feed.xml")

  def test_parses_fixture_item_fields
    xml = File.read(FIXTURE)
    doc = Nokogiri::XML(xml)
    item = doc.at_xpath("//item")

    assert_equal "fixture-1", item.at_xpath("guid").text
    assert_includes item.at_xpath("title").text, "Fixture story"
    assert item.at_xpath("*[local-name()='encoded']")
  end
end
