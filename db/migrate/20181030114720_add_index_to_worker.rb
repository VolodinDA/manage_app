class AddIndexToWorker < ActiveRecord::Migration[5.2]
  def change
	add_index :workers, :name, unique: true
  end
end
