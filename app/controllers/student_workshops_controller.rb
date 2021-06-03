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

  def update
    @student_workshop = StudentWorkshop.find(params[:id])
    @student_workshop.update(student_workshop_params)
    redirect_to workshop_path(@student_workshop.workshop), notice: "status updated"
  end

  def student_workshop_params
    params.require(:student_workshop).permit(:status)
  end
end
