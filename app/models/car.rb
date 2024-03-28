class Car < ApplicationRecord
  alias_attribute :customer_id, :user_id
  enum odometer_type: %i[kph mph]

  belongs_to :customer
  has_many :services, dependent: :delete_all
end
