class AddManagerIdToUsers < ActiveRecord::Migration[7.1]
  def change
    add_reference :users, :manager, foreign_key: { to_table: :users }, index: true
  end
end
