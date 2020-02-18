class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @book = Book.find(params[:book_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.book = Book.find(params[:book_id])
    @booking.user = current_user
    total_points = (@booking.end_date - @booking.start_date).to_i
    @booking.total_points = total_points
    current_user.points = total_points

    if @booking.save
      current_user.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_points)
  end
end
