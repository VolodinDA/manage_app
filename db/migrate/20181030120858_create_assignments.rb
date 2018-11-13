class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.integer :user_id
      t.integer :department_id

      t.timestamps
    end
    add_index :assignments, :user_id
    add_index :assignments, :department_id
    add_index :assignments, [:user_id, :department_id],unique: true
  end
end
