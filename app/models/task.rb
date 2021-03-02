class Task < ApplicationRecord
  belongs_to :user
  belongs_to :milestone

  validates :title, :description, presence: true
  validates :title, length: { minimum: 3,
    too_short: "minimum is %{count} characters" }
end
