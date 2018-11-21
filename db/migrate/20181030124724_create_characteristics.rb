class CreateCharacteristics < ActiveRecord::Migration[5.2]
  def change
    create_table :characteristics do |t|
      t.integer :user_id
      t.integer :ability_id
      t.string :grade

      t.timestamps
    end
    add_index :characteristics, :user_id
    add_index :characteristics, :ability_id
  end
end
