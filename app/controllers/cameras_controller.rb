class CamerasController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    # GET /cameras
    def index
      @cameras = if params[:search]
        Camera.where("name LIKE ?", "%#{params[:search]}%")
      elsif
        user_signed_in?
        @my_cameras = current_user.cameras
      else
        Camera.all
      end
    end

    # GET /cameras/:id
    def show
      @camera = Camera.includes(:reviews).find(params[:id])
      @bookings = @camera.bookings
      @reviews = @camera.reviews
      @review = @camera.reviews.build

      if user_signed_in?
        @my_cameras = current_user.cameras
        @booking = current_user.bookings.new(camera: @camera)
      end
    end

    # GET /cameras/new
    def new
      @camera = Camera.new
    end

    # POST /cameras
    def create
      Rails.logger.debug
      @camera = current_user.cameras.build(camera_params)
      @camera.photo.attach(params[:camera][:photo])

      if @camera.save
        redirect_to @camera, notice: 'Camera was successfully created.'
      else
        flash.now[:alert] = 'There was an error creating the camera.'
        render :new
      end
    end

    # GET /cameras/:id/edit
    def edit
      @camera = Camera.find(params[:id])
    end

    # PATCH/PUT /cameras/:id
    def update
      @camera = Camera.find(params[:id])
      if @camera.update(camera_params)
        redirect_to @camera, notice: 'Camera was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /cameras/:id
    def destroy
      @camera = current_user.cameras.find(params[:id])
      @camera.destroy
      redirect_to cameras_url, notice: 'Camera was successfully destroyed.'
    end

    private

    def camera_params
      params.require(:camera).permit(:brand, :model, :year, :price, :condition, :user_id, :photo)
    end
  end
