# frozen_string_literal: true

class User < ApplicationRecord
  has_many :posts
  has_many :comments

  validates :username, presence: true,
                       length: { maximum: 20 },
                       uniqueness: { case_sensitive: false }

  before_save { email.downcase! }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :email, presence: true,
                    length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_secure_password
  validates :password, presence: true,
                       length: { in: 6..20 }
end
