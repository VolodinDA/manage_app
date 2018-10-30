class AddLanguageIdToWorker < ActiveRecord::Migration[5.2]
  def change
	add_column :workers, :language_id, :integer
  end
end
