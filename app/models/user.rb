# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  has_many :cars, dependent: :destroy

  TYPE_NAMES = %w[Admin Customer Employee].freeze

  validates :type, inclusion: { in: TYPE_NAMES, message: "User must be one of: #{TYPE_NAMES.join(', ')}" }
  validates :email, presence: true, uniqueness: true
  normalizes :email, with: ->(email) { email.strip.downcase }

  generates_token_for :password_reset, expires_in: 15.minutes do
    password_salt&.last(10)
  end
end
