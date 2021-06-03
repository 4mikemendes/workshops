class Review < ApplicationRecord

  belongs_to :workshop
  validates :comment, presence: true
end
