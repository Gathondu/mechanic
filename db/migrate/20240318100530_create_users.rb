class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :type
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :country_code
      t.string :phone_number
      t.integer :role

      t.timestamps
    end
  end
end
