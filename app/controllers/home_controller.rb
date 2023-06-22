class HomeController < ApplicationController
  def index
    @message = "Welcome to my Camera"
    if params[:search]
      @cameras = Camera.where("brand LIKE :search OR model LIKE :search", search: "%#{params[:search]}%")
    elsif user_signed_in?
      @cameras = Camera.where.not(user: current_user)
    else
      @cameras = Camera.all
    end

    if params[:order_by] == 'condition'
      if params[:sort_direction] == 'asc'
        @cameras = @cameras.order(Arel.sql(
          "CASE
            WHEN condition = 'New' THEN 0
            WHEN condition = 'Excelent' THEN 1
            WHEN condition = 'Good' THEN 2
            WHEN condition = 'Used' THEN 3
            ELSE 4
          END ASC")
        )
      else
        @cameras = @cameras.order(Arel.sql(
          "CASE
            WHEN condition = 'New' THEN 0
            WHEN condition = 'Excelent' THEN 1
            WHEN condition = 'Good' THEN 2
            WHEN condition = 'Used' THEN 3
            ELSE 4
          END DESC")
        )
      end
    end

    if params[:order_by] == 'price'
      sort_direction = params[:sort_direction] == 'asc' ? 'ASC' : 'DESC'
      @cameras = @cameras.order(price: sort_direction)
    else
      @cameras = @cameras.order(id: :desc) # Default order if no sorting parameters are provided
    end
  end

  private

  def camera_params
    params.require(:camera).permit(:brand, :model, :year, :price, :condition, :user_id)
  end
end
