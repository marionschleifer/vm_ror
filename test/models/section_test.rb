require 'test_helper'

class SectionTest < ActiveSupport::TestCase
  setup do
    @filled_section = sections(:one1)
    @empty_section = sections(:one2)
  end

  test "emtpy?" do
    assert_not @filled_section.empty?
    assert @empty_section.empty?
  end
end
