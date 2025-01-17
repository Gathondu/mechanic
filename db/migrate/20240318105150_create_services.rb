class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.integer :status
      t.datetime :start_time
      t.string :duration
      t.integer :service_type
      t.text :description
      t.decimal :cost, precision: 10, scale: 2
      t.belongs_to :car, null: false, foreign_key: true
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
