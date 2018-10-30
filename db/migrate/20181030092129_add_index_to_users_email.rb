class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def change
	add_index :users, :email, unique: true
	add_index :users, :remember_token
  end
end
