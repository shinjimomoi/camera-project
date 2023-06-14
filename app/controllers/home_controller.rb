class HomeController < ApplicationController
  def index
    @message = "Welcome to my Camera"
    if params[:search]
      @cameras = Camera.where("model LIKE ?", "%#{params[:search]}%")
    elsif user_signed_in?
      @cameras = Camera.where.not(user: current_user)
    else
      @cameras = Camera.all
    end
  end

  private

  def camera_params
    params.require(:camera).permit(:brand, :model, :year, :price, :condition, :user_id)
  end
end
