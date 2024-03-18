class Customer < User
  has_many :cars, dependet: :destroy
end
