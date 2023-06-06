class HomeController < ApplicationController
  def index
    @message = "Welcome to my Camera"
    @cameras = Camera.all
      if user_signed_in?
        @my_cameras = current_user.cameras
      end
  end

  private

  def camera_params
    params.require(:camera).permit(:brand, :model, :year, :price, :condition, :user_id)
  end
end
