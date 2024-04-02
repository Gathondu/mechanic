class Customer < User
  has_many :cars, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
