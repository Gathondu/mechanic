# frozen_string_literal: true

class User < ApplicationRecord
  Rails.application.eager_load! if Rails.env.development?
  TYPE_NAMES = subclasses.map(&:name)
  validates :type, inclusion: { in: TYPE_NAMES, message: "User must be one of: #{TYPE_NAMES.join(', ')}" }
end
