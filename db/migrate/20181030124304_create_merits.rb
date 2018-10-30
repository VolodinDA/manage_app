class CreateMerits < ActiveRecord::Migration[5.2]
  def change
    create_table :merits do |t|
      t.integer :worker_id
      t.integer :reward_id

      t.timestamps
    end
  end
end
