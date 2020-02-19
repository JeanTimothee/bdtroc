class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
      @book = Book.find(params[:book_id])
    # if user_signed_in?
      @booking = Booking.new
      authorize @booking
    # else
    #   flash[:alert] = "Please Login to make a reservation"
    #   redirect_to new_user_session_path(path: "new-booking")
    # end
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.book = Book.find(params[:book_id])
    @booking.user = current_user
    authorize @booking
    total_points = (@booking.end_date - @booking.start_date).to_i
    @booking.total_points = total_points
    current_user.points = total_points

    bookings = Booking.where(book_id: @booking.book)
    @booking_valid = true
    new_booking_range = (@booking.start_date..@booking.end_date)

    bookings.each do |booking|
      actual_booking_range = (booking.start_date..booking.end_date)
      if actual_booking_range.include?(@booking.start_date) || actual_booking_range.include?(@booking.end_date) || new_booking_range.include?(actual_booking_range)
        @booking_valid = false
      end
    end

    if @booking_valid && @booking.save
      current_user.save
      redirect_to booking_path(@booking)
    else
      redirect_to new_book_booking_path(@booking.book, flash: 'Book not available for this dates')
      # flash[:alert] = "Book not available for this dates"
      # @booking.end_date = nil
      # @booking.start_date = nil
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_points)
  end
end
