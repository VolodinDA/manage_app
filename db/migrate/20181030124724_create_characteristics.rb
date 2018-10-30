class CreateCharacteristics < ActiveRecord::Migration[5.2]
  def change
    create_table :characteristics do |t|
      t.integer :worker_id
      t.integer :ability_id
      t.integer :grade

      t.timestamps
    end
  end
end
