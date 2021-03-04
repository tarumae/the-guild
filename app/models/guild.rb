class Guild < ApplicationRecord
  belongs_to :user
  has_many :posts, dependent: :destroy
  has_many :guildmemberships
  has_many :guild_members, through: :guildmemberships, source: :user
  has_many :milestones

  CATEGORIES = %w[Family Work Gaming Sports Education General]
  validates :category, presence: true, inclusion: { in: CATEGORIES }
  validates :name, presence: true, length: { minimum: 3, maximum: 60 }

  def members
    (guild_members + [user]).flatten
  end
end
