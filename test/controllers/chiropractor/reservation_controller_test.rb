require 'test_helper'

class Chiropractor::ReservationControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chiropractor_reservation_index_url
    assert_response :success
  end

end
