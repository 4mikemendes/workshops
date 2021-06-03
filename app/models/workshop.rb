class Workshop < ApplicationRecord
  belongs_to :user
  has_many :student_workshops, dependent: :destroy
  has_many :users, through: :student_workshops
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
  has_many :reviews, dependent: :destroy
  include PgSearch::Model
  pg_search_scope :global_search,
    against: [ :name, :workshop_description ],

    using: {
      tsearch: { prefix: true }
    }
end
