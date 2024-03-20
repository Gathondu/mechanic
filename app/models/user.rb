# frozen_string_literal: true

class User < ApplicationRecord
  TYPE_NAMES = %w[Admin Customer Employee].freeze
  validates :type, inclusion: { in: TYPE_NAMES, message: "User must be one of: #{TYPE_NAMES.join(', ')}" }
end
