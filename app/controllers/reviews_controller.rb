class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @session = Session.find(params[:session_id])
    @review.user = current_user
    @review.session = @session
    if @review.save
      redirect_to session_path(@session)
    else
      render 'session/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:body)
  end
end
