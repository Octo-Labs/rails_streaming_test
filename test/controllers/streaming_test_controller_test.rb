require 'test_helper'

class StreamingTestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get streaming_test_index_url
    assert_response :success
  end

end
