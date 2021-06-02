class WorkshopsController < ApplicationController
  def index
    @workshops = Workshop.all
    @markers = @workshops.geocoded.map do |workshop|
      {
        lat: workshop.latitude,
        lng: workshop.longitude
      }
    end
  end

  def show
    @workshop = Workshop.find(params[:id])
    @student_workshop = StudentWorkshop.new
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

  def book
    @workshop = Workshop.find(params[:id])
    if @workshop.student_workshop.where(email: params[:email]).count > 0
      redirect_to workshops_path, alert: "THIS EMAIL HAS ALREADY BOOKED, YOU FOOL!"
    else
      StudentWorkshop.create!(name: params[:name], email: params[:email], event_id: @event.id)
    end
  end

  private

  def workshop_params
    params.require(:workshop).permit(:name, :workshop_description, :location, :price, :starting_date, :ending_date, :youtube_url, photos: [])
  end
end
