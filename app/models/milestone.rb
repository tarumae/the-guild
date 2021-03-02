class Milestone < ApplicationRecord
  belongs_to :guild
  has_many :tasks, dependent: :destroy

  validates :title, :description, :deadline, presence: true
  validates :title, length: { minimum: 3,
    too_short: "minimum is %{count} characters" }
end
