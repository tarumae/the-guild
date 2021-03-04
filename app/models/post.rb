class Post < ApplicationRecord
  belongs_to :user
  belongs_to :guild
  validates :content, presence: true
  has_many_attached :photos #check with Lenny
  has_rich_text :content # or :rich_body ?
end
