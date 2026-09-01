# frozen_string_literal: true

require_relative "../test_helper"
require_relative "../../lib/wbez_bootstrap_starter/version"

class VersionTest < Minitest::Test
  def test_version_constant_exists
    assert_match(/\A\d+\.\d+\.\d+\z/, WbezBootstrapStarter::VERSION)
  end
end
