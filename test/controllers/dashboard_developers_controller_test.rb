require 'test_helper'

class DashboardDevelopersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_developers_index_url
    assert_response :success
  end

  test "should get show" do
    get dashboard_developers_show_url
    assert_response :success
  end

  test "should get edit" do
    get dashboard_developers_edit_url
    assert_response :success
  end

  test "should get new" do
    get dashboard_developers_new_url
    assert_response :success
  end

  test "should get create" do
    get dashboard_developers_create_url
    assert_response :success
  end

end
