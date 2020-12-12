require 'test_helper'

class PalindromeControllerTest < ActionDispatch::IntegrationTest
  test "should redirect without signing in" do
    get palindrome_view_url, params: {num: 120}
    assert_response :redirect
  end

  test "should redirect to login without signing in" do
    get root_url
    assert_redirected_to controller: :session, action: :login
  end

  test "should get diffrent results for different input" do 
    val1 = PalindromeData.find_by(num: 35).squared
    val2 = PalindromeData.find_by(num: 24).squared
    assert_not_equal val1, val2
  end
end
