class WorkshopsController < ApplicationController


  def index
    @workshop = Workshop.all
  end

  def show
    @workshop = Workshop.new

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
