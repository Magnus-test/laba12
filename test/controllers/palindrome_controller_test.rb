require 'test_helper'

class PalindromeControllerTest < ActionDispatch::IntegrationTest
  test "should get input" do
    get palindrome_input_url
    assert_response :success
  end

  test "should get view" do
    get palindrome_view_url
    assert_response :success
  end

  test "should get diffrent results for different input" do 
    val1 = PalindromeData.find_by(num: 35).squared
    val2 = PalindromeData.find_by(num: 24).squared
    assert_not_equal val1, val2
  end
end
