require "test_helper"

class ObservationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get observations_index_url
    assert_response :success
  end

  test "should get show" do
    get observations_show_url
    assert_response :success
  end
end
