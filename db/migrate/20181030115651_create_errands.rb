class CreateErrands < ActiveRecord::Migration[5.2]
  def change
    create_table :errands do |t|
      t.string :address
      t.boolean :is_finished, default: false

      t.timestamps
    end
	add_index :errands, :address
  end
end
