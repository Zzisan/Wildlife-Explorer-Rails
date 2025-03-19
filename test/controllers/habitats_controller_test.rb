require "test_helper"

class HabitatsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get habitats_index_url
    assert_response :success
  end

  test "should get show" do
    get habitats_show_url
    assert_response :success
  end
end
