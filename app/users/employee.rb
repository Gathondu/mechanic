class Employee < User
  has_many :services, dependent: :delete_all

  belongs_to :admin, foreign_key: 'manager_id'
end
