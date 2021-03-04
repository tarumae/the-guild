class Guildmembership < ApplicationRecord
  belongs_to :user
  belongs_to :guild
  validates :user, uniqueness: { scope: :guild }
end
