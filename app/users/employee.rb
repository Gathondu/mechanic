class Employee < User
  attribute :admin_id
  has_many :services, dependent: :delete_all

  belongs_to :admin
end
