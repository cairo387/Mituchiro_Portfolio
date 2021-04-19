require 'test_helper'

class ChiropractorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chiropractors_index_url
    assert_response :success
  end

  test "should get show" do
    get chiropractors_show_url
    assert_response :success
  end

end
