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
      @booking = Booking.new
      authorize @booking
  end

  def create
    @booking = params[:booking]
    @range = @booking[:start_date]
    @array = @range.split(" ")
    @booking = Booking.new(booking_params)
    @booking.end_date  = @array[2]
    @booking.book = Book.find(params[:book_id])
    @booking.user = current_user
    authorize @booking

    @booking_valid = true
    # Dates validation

    bookings = Booking.where(book_id: @booking.book)
    new_booking_range = (@booking.start_date..@booking.end_date)

    unless @booking.start_date.nil? || @booking.end_date.nil?
      bookings.each do |booking|
        actual_booking_range = (booking.start_date..booking.end_date)
        if actual_booking_range.include?(@booking.start_date) || actual_booking_range.include?(@booking.end_date) || new_booking_range.include?(actual_booking_range)
          @booking_valid = false
          @alert = "Book not available for these dates"
        end
      end
      @booking.total_points = (@booking.end_date - @booking.start_date).to_i + 1
      @booking.book.user.points = @booking.total_points
      if current_user.points < @booking.total_points
        @booking_valid = false
        @alert = "Not enough credit"
      else
        current_user.points -= @booking.total_points
      end
    end


    # Points logic


    # Redirection

    if @booking_valid && @booking.save
      current_user.save
      @booking.book.user.save
      flash[:notice] = "Reservation confirmed! Happy Reading!"
      redirect_to dashboard_path
    else
      redirect_to new_book_booking_path(@booking.book, flash:@alert)
    end

  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_points)
  end
end
