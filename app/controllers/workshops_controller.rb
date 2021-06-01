class WorkshopsController < ApplicationController
  def index
    @workshops = Workshop.all
  end

  def show
    @workshop = Workshop.find(params[:id])
  end

  def new
    @workshop = Workshop.new
  end

  def create
    @workshop = Workshop.new(workshop_params)
    @workshop.user = current_user
    if @workshop.save!
      redirect_to workshop_path(@workshop)
    else
      render :new
    end
  end

  def edit
    @workshop = Workshop.find(params[:id])
  end

  def update
    @workshop = Workshop.find(params[:id])
    @workshop.update(workshop_params)
    redirect_to workshop_path(@workshop)
  end

  def destroy
    @workshop = Workshop.find(params[:id])
    @workshop.destroy
    redirect_to workshops_path
  end

  def workshop_params
    params.require(:workshop).permit(:name, :workshop_description, :location, :price, :starting_date, :ending_date, :photo)
  end
end
