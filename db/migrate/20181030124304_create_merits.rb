class CreateMerits < ActiveRecord::Migration[5.2]
  def change
    create_table :merits do |t|
      t.integer :user_id
      t.integer :reward_id

      t.timestamps
    end
  end
end
