class Admin < User
  has_many :employees, dependent: :destroy, foreign_key: 'manager_id'

  validates :email, presence: true, uniqueness: true
end
