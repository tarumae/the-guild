class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :guildmemberships
  has_many :guilds
  has_many :member_guilds, through: :guildmemberships, source: :guild
  has_one_attached :photo
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include PgSearch::Model
  pg_search_scope :search_by_name_nickname_and_email,
                  against: %i[first_name last_name nickname email],
                  using: {
                    tsearch: { prefix: true }
                  }
  def all_guilds
    guilds + member_guilds
  end
end
