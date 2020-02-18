class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end
  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save # unable to save because no user yet
      redirect_to book_path(@book)
    else render :new
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book)
  end

  def destroy
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
