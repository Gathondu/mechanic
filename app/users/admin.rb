class Admin < User
  has_many :employees, dependent: :delete_all, foreign_key: 'manager_id'

  validates :email, presence: true, uniqueness: true
end
