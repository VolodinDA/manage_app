class AddAssignmentIdToUsers < ActiveRecord::Migration[5.2]
  def change
	  add_column :users, :assignment_id, :integer
  end
end
