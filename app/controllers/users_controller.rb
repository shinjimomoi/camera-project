class UsersController < ApplicationController

    before_action :set_user, except: [:show]

    # GET /users
    def index
      @users = User.all
    end

    # GET /users/:id
    def show
      if params[:id] == 'sign_out'
        # Handle sign out here, such as calling the sign_out method provided by Devise
        sign_out(current_user)
        redirect_to root_path, notice: 'Signed out successfully.'
      else
        @user = User.find(params[:id])
      end
    end

    # GET /users/new
    def new
      @user = User.new
    end

    # POST /users
    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to @user, notice: 'User was successfully created.'
        Rails.logger.debug("saved")
      else
        Rails.logger.debug("error")

        render :new, notice: 'There was an error'
      end
    end

    # GET /users/:id/edit
    def edit
      @user = User.find(params[:id])
    end

    # PATCH/PUT /users/:id
    def update
      if @user.update(user_params)
        redirect_back fallback_location: @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end


    # DELETE /users/:id
    def destroy
      @user = User.find(params[:id])
      @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    end

    private

    def user_params
      params.require(:user).permit(:name, :email, :age, :country, :password)
    end


    def set_user
      @user = User.find(params[:id]) unless params[:id] == 'sign_out'
    end
  end
