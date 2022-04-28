require 'test_helper'

class DashboardQasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dashboard_qas_index_url
    assert_response :success
  end

  test "should get show" do
    get dashboard_qas_show_url
    assert_response :success
  end

  test "should get edit" do
    get dashboard_qas_edit_url
    assert_response :success
  end

  test "should get new" do
    get dashboard_qas_new_url
    assert_response :success
  end

  test "should get create" do
    get dashboard_qas_create_url
    assert_response :success
  end

end
