class Service < ApplicationRecord
  belongs_to :car
  belongs_to :employee

  attribute :duration, :duration
end
