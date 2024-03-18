class Employee < User
  has_many :services

  belongs_to :admin
end
