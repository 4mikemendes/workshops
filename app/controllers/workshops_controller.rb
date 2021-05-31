class WorkshopsController < ApplicationController

  def index
    @workshop = Workshop.all
  end

  def show
    @workshop = Workshop.new
  end
end
