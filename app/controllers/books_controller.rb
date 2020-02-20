class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @books = Book.all
    @books = policy_scope(Book)
  end

  def show
    @book = Book.find(params[:id])
    @bookings = Booking.where(book_id: @book)
    @marker =
      {
        lat: @book.user.latitude,
        lng: @book.user.longitude,
        infoWindow: render_to_string(partial: "map_info_window", locals: { user: @book.user }),
        image_url: helpers.asset_url('mapmarker.png')
      }

    authorize @book
  end

  def new
    @book = Book.new
    #raise
    authorize @book
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    authorize @book
    if @book.save
      redirect_to book_path(@book)
    else render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
    authorize @book
  end

  def update
    @book = Book.find(params[:id])
    authorize @book
    if @book.update(book_params)
      redirect_to book_path(@book)
    else render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    authorize @book
    @book.destroy

    # no need for app/views/books/destroy.html.erb
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:name, :genre, :cover, :illustrator, :scenarist, :description, :date, previews: [])
  end
end
