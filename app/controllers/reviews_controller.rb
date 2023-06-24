class ReviewsController < ApplicationController
  def create
  @camera = Camera.find(params[:camera_id])
  @review = @camera.reviews.build(review_params)
  @review.user = current_user # Associate the user with the review
  redirect_to @camera, notice: 'Review created successfully.' if @review.save
end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :camera_id)
  end
end
