class Organization < ApplicationRecord
  validates :name, :description, presence: true
  validates :name, length: { in: 5..30 }
  validates :description, length: { in: 10..250 }
  validates :name, uniqueness: true
  belongs_to :user, optional: true
  has_many :members
  has_many :users, through: :members

    def users_that_added

    User.joins(:organization_adds).select('users.id, users.first_name, users.last_name, COUNT(*) as times_added').where('organization_adds.organization_id = ?', self.id).group('users.id').order('times_added desc')

end

