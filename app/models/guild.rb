class Guild < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :guildusers
  has_many :milestones

  CATEGORIES = %w[Family Work Gaming Sports Education General]
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :name, presence: true, length: { minimum: 3, maximum: 60 }
  validates :user, presence: true
end
