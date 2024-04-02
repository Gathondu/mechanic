class Car < ApplicationRecord
  enum odometer_type: %i[kph mph]

  belongs_to :user
  has_many :services, dependent: :destroy
end
