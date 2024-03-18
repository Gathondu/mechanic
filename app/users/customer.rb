class Customer < User
  has_many :cars, dependent: :destroy
end
