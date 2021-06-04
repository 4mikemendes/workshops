class StudentWorkshop < ApplicationRecord
  belongs_to :user
  belongs_to :workshop
  has_many   :request_answers

  validates :workshop, :user, presence: true
def badge_status
  if status == "pending"
    return "badge-info"
  elsif status == "accepted"
    return "badge-success"
  elsif status == "rejected"
    return "badge-danger"
  end
end
end
