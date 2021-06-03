class StudentWorkshop < ApplicationRecord
  belongs_to :user
  belongs_to :workshop
  has_many   :request_answers

  validates :workshop, :user, presence: true

end
