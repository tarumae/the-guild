class Post < ApplicationRecord
  belongs_to :user
  belongs_to :guild
  validates :content, presence: true
end
