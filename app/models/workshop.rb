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
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  has_one_attached :photo
  has_many_attached :photos

end
