class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.string :designation

      t.timestamps
    end
	add_index :departments,  :designation
  end
end
