class CreateObjectives < ActiveRecord::Migration[5.2]
  def change
    create_table :objectives do |t|
      t.string :description
      t.integer :departmnent_id

      t.timestamps
    end
    add_index :objectives, :departmnent_id
  end
end
