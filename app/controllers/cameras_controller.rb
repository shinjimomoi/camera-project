class CamerasController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    # GET /cameras
    def index
      @cameras = Camera.all
      if user_signed_in?
        @my_cameras = current_user.cameras
      end
    end

    # GET /cameras/:id
    def show
      @camera = Camera.find(params[:id])
      if user_signed_in?
        @my_cameras = current_user.cameras
      end
    end

    # GET /cameras/new
    def new
      @camera = Camera.new
    end

    # POST /cameras
    def create

      @camera = current_user.cameras.build(camera_params)
      if @camera.save
        puts "coming here"
        redirect_to @camera, notice: 'Camera was successfully created.'
      else
        flash.now[:alert] = 'There was an error creating the camera.'
        render :new, alert: 'There was an error.'
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
      params.require(:camera).permit(:brand, :model, :year, :price, :condition, :user_id)
    end
  end
