require 'test_helper'

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get payments_new_url
    assert_response :success
  end

  test "should get success" do
    get payments_success_url
    assert_response :success
  end

  test "should get failed" do
    get payments_failed_url
    assert_response :success
  end

end
