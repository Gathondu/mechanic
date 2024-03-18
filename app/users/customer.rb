class Customer < User
  has_many :cars, dependent: :delete_all
end
