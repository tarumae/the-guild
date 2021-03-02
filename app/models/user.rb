class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :guildmemberships
  has_many :guilds
  has_many :member_guilds, through: :guildmemberships, source: :guild
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def all_guilds
    guilds + member_guilds
  end

end
