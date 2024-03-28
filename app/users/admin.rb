class Admin < User
  has_many :employees, dependent: :delete_all, foreign_key: 'manager_id'
end
