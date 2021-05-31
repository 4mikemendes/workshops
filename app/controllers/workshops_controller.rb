class WorkshopsController < ApplicationController
  def new
    @workshop = Workshop.new
  end

  def create
    @workshop = Workshop.new(list_params)
    if @workshop.save
      redirect_to workshop_path(@workshop)
    else
      render :new
    end
  end

  def list_params
    params.require(:workshop).permit(:name, :workshop_description, :location, :price, :starting_date, :ending_date)
  end
end
