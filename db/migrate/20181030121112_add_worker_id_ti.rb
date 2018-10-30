class AddWorkerIdTi < ActiveRecord::Migration[5.2]
  def change
	add_column :errands, :worker_id, :integer
  end
end
