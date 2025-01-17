class CreateCars < ActiveRecord::Migration[7.1]
  def change
    create_table :cars do |t|
      t.string :make
      t.string :model
      t.string :year_of_manufactuer
      t.string :vin
      t.string :registration
      t.string :mileage
      t.integer :odometer_type
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
