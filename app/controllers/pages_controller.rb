class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
  end

  def dashboard
    @workshops = current_user.workshops
    @validated_workshops = current_user.student_workshops.where(status: "accepted")
  end
end
