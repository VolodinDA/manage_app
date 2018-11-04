class CreateSpeeches < ActiveRecord::Migration[5.2]
  def change
    create_table :speeches do |t|
      t.integer :language_id
      t.integer :user_id

      t.timestamps
    end
    add_index :speeches, :language_id
    add_index :speeches, :user_id
    add_index :speeches, [:language_id, :user_id], unique: true
  end
end
