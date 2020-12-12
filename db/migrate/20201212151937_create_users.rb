class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :username
      t.stringrails :password_digest
      t.string :g
      t.string :scaffold
      t.string :user
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
