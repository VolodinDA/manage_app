class CreateWorkers < ActiveRecord::Migration[5.2]
  def change
    create_table :workers do |t|
      t.string :name
      t.date :employment_date

      t.timestamps
    end
  end
end
