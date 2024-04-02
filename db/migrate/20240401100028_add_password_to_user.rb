class AddPasswordToUser < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :password_digest, :string
    add_column :users, :super_admin, :bool, default: false, null: false
    change_column_null :users, :email, false
    add_index :users, :email, unique: true
  end
end
