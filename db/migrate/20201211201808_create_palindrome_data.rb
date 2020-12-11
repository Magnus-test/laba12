class CreatePalindromeData < ActiveRecord::Migration[6.0]
  def change
    create_table :palindrome_data do |t|
      t.integer :num
      t.integer :count
      t.string :nums
      t.string :squared

      t.timestamps
    end
  end
end
