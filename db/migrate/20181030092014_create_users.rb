class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_token
      t.boolean :admin, default: false
      t.date :employment_date
      t.integer :department_id
      t.integer :errand_id
	  t.string :region
	    t.string :avatar
		
      t.timestamps
    end
  end
end
