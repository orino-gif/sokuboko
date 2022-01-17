require 'test_helper'

class OpinionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get opinion_index_url
    assert_response :success
  end

end
