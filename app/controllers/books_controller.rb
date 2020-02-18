class BooksController < ApplicationController
  def index
    @books = Book.all
    @books = policy_scope(Book).order(created_at: :desc)
  end

  def show
    @book = Book.find(params[:id])
    @bookings = Booking.where(book_id: @book)
    authorize @book
  end

  def new
    if user_signed_in?
      @book = Book.new
    else redirect_to 'devise/sessions#new'
    end
    skip_after_action :verify_authorized

  end

  def create
    @book = Book.new(book_params)
    if @book.save # unable to save because no user yet
      redirect_to book_path(@book)
    else render :new
    end
    authorize @book
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    authorize @book
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
    authorize @book
    @book = Book.find(params[:id])
    @book.destroy

    # no need for app/views/books/destroy.html.erb
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:name,:genre, :preview, :cover_url, :illustrator, :scenarist, :description, :date)
  end
end
