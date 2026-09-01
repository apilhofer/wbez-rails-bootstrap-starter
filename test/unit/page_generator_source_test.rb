# frozen_string_literal: true

require_relative "../test_helper"

class PageGeneratorSourceTest < Minitest::Test
  def test_wbez_page_generator_rejects_unknown_type
    source = File.read(File.join(ROOT, "lib/generators/wbez/page/page_generator.rb"))
    assert_includes source, 'Unknown --type'
    assert_includes source, '"article"'
    assert_includes source, '"home"'
  end

  def test_support_lib_lists_page_generators
    source = File.read(File.join(ROOT, "template/install/base.rb"))
    assert_includes source, "lib/generators/wbez/page/page_generator.rb"
    assert_includes source, "lib/generators/suntimes/page/page_generator.rb"
  end
end
