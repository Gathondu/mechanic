class Admin < User
  has_many :employees, dependent: :delete_all
end
