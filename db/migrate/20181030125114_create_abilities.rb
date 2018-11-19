class CreateAbilities < ActiveRecord::Migration[5.2]
  def change
    create_table :abilities do |t|
      t.string :description

      t.timestamps
    end
	add_index :abilities, :description, unique: true
  end
end
