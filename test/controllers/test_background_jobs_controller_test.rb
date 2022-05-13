require 'test_helper'

class TestBackgroundJobsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get test_background_jobs_index_url
    assert_response :success
  end

end
