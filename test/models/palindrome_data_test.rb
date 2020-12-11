require 'test_helper'

class PalindromeDataTest < ActiveSupport::TestCase
  def test_create
    val = PalindromeData.create(num: 3, count:3, nums: "1 2 3", squared: "1 4 9").squared
    PalindromeData.find_by(num: 3).destroy unless PalindromeData.find_by(num: 3).nil?

    assert_equal val, "1 4 9"
  end

  def test_uniqueness
    wrong_val = PalindromeData.create(num: 35, count: 404, nums: "...", squared: "...").count
    true_val = PalindromeData.find_by(num: 35).count

    assert_equal true_val, 6
    assert_not_equal wrong_val, 6
  end
end
