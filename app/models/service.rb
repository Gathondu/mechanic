class Service < ApplicationRecord
  belongs_to :car
  belongs_to :employee, optional: true

  alias_attribute :employee_id, :user_id
  attribute :duration, :duration

  enum status: %i[pending started complete cancelled]
  enum service_type: %i[minor major custom]
end
