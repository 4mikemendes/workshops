class Workshop < ApplicationRecord
  belongs_to :user
  validates :name
end
