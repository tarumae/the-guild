class Guild < ApplicationRecord
  belongs_to :user
  TYPES = %i[Family Work Gaming Sports Education General]
  validates :type, inclusion: { in: TYPES }
end
