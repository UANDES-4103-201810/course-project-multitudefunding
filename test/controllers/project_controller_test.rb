require 'test_helper'

class ProjectControllerTest < ActionDispatch::IntegrationTest
  test "should get show_project" do
    get project_show_project_url
    assert_response :success
  end

end
