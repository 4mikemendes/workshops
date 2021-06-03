class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @workshop = Workshop.find(params[:workshop_id])
    @review.workshop = @workshop
    if @review.save
      redirect_to workshop_path(@workshop)
    else
      render 'workshop/show'
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to workshop_path(@review.workshop)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

end
