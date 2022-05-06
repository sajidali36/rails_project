require 'test_helper'

class DashboardManagersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_managers_index_url
    assert_response :success
  end

  test "should get show" do
    get dashboard_managers_show_url
    assert_response :success
  end

  test "should get edit" do
    get dashboard_managers_edit_url
    assert_response :success
  end

  test "should get new" do
    get dashboard_managers_new_url
    assert_response :success
  end

  test "should get create" do
    get dashboard_managers_create_url
    assert_response :success
  end

end
