class BookingsController < ApplicationController
    # GET /bookings
    def index
      @bookings = Booking.all
    end

    # GET /bookings/:id
    def show
      @booking = Booking.find(params[:id])
    end

    # GET /bookings/new
    def new
      @camera = Camera.find(params[:camera_id])
      @booking = current_user.bookings.new(camera: @camera)
    end

    # POST /bookings
    def create
      @booking = current_user.bookings.new(booking_params)
      if @booking.save
        puts @booking.errors.full_messages
        redirect_to @booking, notice: 'Booking was successfully created.'
      else
        puts @booking.errors.full_messages
        render :new
      end
    end

    # DELETE /cameras/:id
    def destroy
      @booking = Booking.find(params[:id])
      @booking.destroy
      redirect_to cameras_url, notice: 'Camera was successfully destroyed.'
    end

    private

    def booking_params
      params.require(:booking).permit(:start_date, :end_date, :camera_id)
    end

end
