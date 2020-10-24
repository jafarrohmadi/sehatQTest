class User < ApplicationRecord
  has_secure_password

  validates :email, length: {minimum: 1}, presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :name, length: {minimum: 1}

  enum role: %i[admin doctor patient].freeze

end
