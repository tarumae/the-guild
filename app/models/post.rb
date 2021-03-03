class Post < ApplicationRecord
  belongs_to :user
  belongs_to :guild
  validates :description, presence: true
end
