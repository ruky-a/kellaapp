require 'test_helper'

class TaskControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get task_show_url
    assert_response :success
  end

end
