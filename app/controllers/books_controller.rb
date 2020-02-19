class BooksController < ApplicationController
  def index
    @books = Book.all
    @books = policy_scope(Book)
  end

  def show
    @book = Book.find(params[:id])
    @bookings = Booking.where(book_id: @book)
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
    authorize @book
    @book = Book.find(params[:id])
    @book.destroy

    # no need for app/views/books/destroy.html.erb
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:name, :genre, :cover, :illustrator, :scenarist, :description, :date, previews: [])
  end
end
