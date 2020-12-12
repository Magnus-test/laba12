class PalindromeData < ApplicationRecord
    validates :num, presence: true, uniqueness: true
    validates :nums, presence: true
    validates :count, presence: true
    validates :squared, presence: true
end
