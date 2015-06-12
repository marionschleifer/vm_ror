require 'test_helper'

class MachineTest < ActiveSupport::TestCase

  setup do
    @machine = Machine.new
    @machine.name = "My machine"
    @machine.positions = 3
    @machine.current_position = 1
  end

  test "turn" do
    assert 1, @machine.current_position
    @machine.turn!
    assert 2, @machine.current_position
  end

  test "turn back to first position" do
    3.times do
      @machine.turn!
    end
    assert 1, @machine.current_position
  end

end
