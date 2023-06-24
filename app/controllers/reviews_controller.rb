class ReviewsController < ApplicationController
  def create
  @camera = Camera.find(params[:camera_id])
  @review = @camera.reviews.build(review_params)
  @review.user = current_user # Associate the user with the review

  if @review.save
    # Review saved successfully
    redirect_to @camera, notice: 'Review created successfully.'
  else
    # Handle validation errors or any other scenario where the review couldn't be saved
    # Redirect or render as per your application's requirements
  end
end

  private

  def review_params
    params.require(:review).permit(:rating, :comment, :camera_id)
  end
end
