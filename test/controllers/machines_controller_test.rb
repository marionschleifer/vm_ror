require 'test_helper'

class MachinesControllerTest < ActionController::TestCase
  setup do
    @machine = machines(:icecream_machine)
  end

  test "should show machine" do
    get :show, id: @machine
    assert_response :success
  end
end
