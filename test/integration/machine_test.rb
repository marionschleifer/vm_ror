require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = :selenium
    @machine = machines(:icecream_machine)
  end

  test "show machine page" do
    visit machine_url(@machine)
    assert page.has_content?(@machine.name)
    assert page.has_content?("TURN")
  end
end
