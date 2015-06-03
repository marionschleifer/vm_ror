require 'test_helper'

class TurnTablesControllerTest < ActionController::TestCase
  setup do
    @turn_table = turn_tables(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:turn_tables)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create turn_table" do
    assert_difference('TurnTable.count') do
      post :create, turn_table: { machine_id: @turn_table.machine_id, open: @turn_table.open }
    end

    assert_redirected_to turn_table_path(assigns(:turn_table))
  end

  test "should show turn_table" do
    get :show, id: @turn_table
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @turn_table
    assert_response :success
  end

  test "should update turn_table" do
    patch :update, id: @turn_table, turn_table: { machine_id: @turn_table.machine_id, open: @turn_table.open }
    assert_redirected_to turn_table_path(assigns(:turn_table))
  end

  test "should destroy turn_table" do
    assert_difference('TurnTable.count', -1) do
      delete :destroy, id: @turn_table
    end

    assert_redirected_to turn_tables_path
  end
end
