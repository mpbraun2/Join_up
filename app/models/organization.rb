class Organization < ApplicationRecord
  validates :name, :description, presence: true
  validates :name, length: { in: 5..30 }
  validates :description, length: { in: 10..250 }
  validates :name, uniqueness: true
  belongs_to :user, optional: true
  has_many :members
  has_many :users, through: :members
end
