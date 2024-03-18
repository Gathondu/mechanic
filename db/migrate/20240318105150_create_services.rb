class CreateServices < ActiveRecord::Migration[7.1]
  def change
    create_table :services do |t|
      t.integer :status
      t.datetime :start_time
      t.string :duration
      t.integer :type
      t.text :description
      t.decimal :cost
      t.belongs_to :car, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
