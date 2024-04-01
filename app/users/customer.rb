class Customer < User
  has_many :cars, dependent: :delete_all

  validates :email, presence: true, uniqueness: true
end
