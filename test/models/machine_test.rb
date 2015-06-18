require 'test_helper'

class MachineTest < ActiveSupport::TestCase

  setup do
    @machine = machines(:icecream_machine)
  end

  test "turn" do
    assert_equal 1, @machine.current_position
    @machine.turn!
    assert_equal 2, @machine.current_position
  end

  test "turn back to first position" do
    @machine.positions.times do
      @machine.turn!
    end
    assert_equal 1, @machine.current_position
  end

end
