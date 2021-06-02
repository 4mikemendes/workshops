class StudentWorkshopsController < ApplicationController



  def create
    @student_workshop = StudentWorkshop.new
    @workshop = Workshop.find(params[:workshop_id])
    @student_workshop.user = current_user
    @student_workshop.status = "pending"
    @student_workshop.workshop = @workshop
    if @student_workshop.save!
      redirect_to workshop_path(@workshop)
    else
      render :new
    end
  end
end
