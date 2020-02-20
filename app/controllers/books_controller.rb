class BooksController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @books = policy_scope(Book) # pundit authorization
    if params[:query].present?
      @books = Book.search_by_name_illustrator_scenarist_description(params[:query])
    else @books = Book.all
    end
  end

  def show
    @book = Book.find(params[:id])
    @bookings = Booking.where(book_id: @book)
    authorize @book
  end

  def new
    @book = Book.new
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
