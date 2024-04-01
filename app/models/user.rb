# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  TYPE_NAMES = %w[Admin Customer Employee].freeze
  validates :type, inclusion: { in: TYPE_NAMES, message: "User must be one of: #{TYPE_NAMES.join(', ')}" }

  validates :email, presence: true, uniqueness: true
  normalizes :email, with: ->(email) { email.strip.downcase }
end
