class User < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :email, :password, presence: true
  validates :first_name, :last_name, length: { in: 2..30 }
  validates :password, length: { in: 5..15 }
  validates :email, uniqueness: true
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create

  has_many :organizations
  has_many :members
  has_many :organizations_memberships, through: :members, source: :organization
end
