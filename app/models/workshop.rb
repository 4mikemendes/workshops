class Workshop < ApplicationRecord
  belongs_to :user
  has_many :student_workshops, dependent: :destroy
  has_many :users, through: :student_worshops
  validates :name, presence: true
  validates :workshop_description, presence: true
  validates :location, presence: true
  validates :price, presence: true
  validates :starting_date, presence: true
  validates :ending_date, presence: true
end
