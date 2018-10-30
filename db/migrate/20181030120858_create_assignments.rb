class CreateAssignments < ActiveRecord::Migration[5.2]
  def change
    create_table :assignments do |t|
      t.integer :worker_id
      t.integer :department_id
      t.integer :objective_id

      t.timestamps
    end
  end
end
