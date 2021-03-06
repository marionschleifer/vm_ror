require 'test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest
  setup do
    Capybara.current_driver = :selenium
    @machine = machines(:icecream_machine)
  end

  test "show machine page" do
    visit machine_path(@machine)
    assert page.has_content?(@machine.name)
    assert page.has_content?("TURN")
  end

  test "show price" do
    visit machine_path(@machine)
    assert page.has_content?("3.50")
  end

  test "machine turn" do
    visit machine_path(@machine)
    assert page.has_content?("3.50")
    click_link("TURN")
    click_link("TURN")
    assert page.has_content?("0.90")
  end

  test "create article in service mode" do
    visit machine_path(@machine)
    click_link('Service')
    click_link('+', match: :first)
    fill_in('Name', :with => 'Strawberry')
    fill_in('Price', :with => '400')
    select '2017', :from => 'article[expiry_date(1i)]'
    select 'August', :from => 'article[expiry_date(2i)]'
    select '1', :from => 'article[expiry_date(3i)]'
    click_button('Speichern')
    visit machine_path(@machine)
    assert page.has_content?('Strawberry')
  end

  test "change to service mode and back" do
    visit machine_path(@machine)
    click_link('Service')
    assert page.has_content?('Create turntable')
    click_link('Customer')
    assert page.has_content?('TURN')
  end

  test "remove article in service mode" do
    visit machine_path(@machine)
    click_link('Service')
    click_link('Solero')
    assert page.has_no_content?('Solero')
  end

  test "purchase article" do
    visit machine_path(@machine)
    click_link('Purchase', match: :first)
    visit machine_path(@machine)
    assert page.has_no_content?('Purchase')
  end

  test "add purchased article to activities" do
    visit machine_path(@machine)
    click_link('Purchase', match: :first)
    click_link('Activities')
    assert page.has_content?('Solero')
  end

end
