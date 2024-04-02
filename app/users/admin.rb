class Admin < User
  has_many :employees, dependent: :destroy, foreign_key: 'manager_id'
end
