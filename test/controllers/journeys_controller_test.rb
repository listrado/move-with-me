require 'test_helper'

class JourneysControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get journeys_new_url
    assert_response :success
  end

  test "should get create" do
    get journeys_create_url
    assert_response :success
  end

end
