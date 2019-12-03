require 'test_helper'

class JourneyMatchControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get journey_match_new_url
    assert_response :success
  end

  test "should get create" do
    get journey_match_create_url
    assert_response :success
  end

end
