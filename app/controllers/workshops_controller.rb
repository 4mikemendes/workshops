class WorkshopsController < ApplicationController

  def index
    @workshop = Workshop.all
  end

  def show
    @student_workshop = Student_workshop.new
  end
end
