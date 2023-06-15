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

    if params[:order_by] == 'condition'
      @cameras = @cameras.order(Arel.sql(
        "CASE
          WHEN condition = 'New' THEN 0
          WHEN condition = 'Excelent' THEN 1
          WHEN condition = 'Good' THEN 2
          WHEN condition = 'Used' THEN 3
          ELSE 4
        END")
      )
    end

  end

  private

  def camera_params
    params.require(:camera).permit(:brand, :model, :year, :price, :condition, :user_id)
  end
end
