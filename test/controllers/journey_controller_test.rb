require 'test_helper'

class JourneyControllerTest < ActionDispatch::IntegrationTest
  test "should get dedestroy" do
    get journey_dedestroy_url
    assert_response :success
  end

end
