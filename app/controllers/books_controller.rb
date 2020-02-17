class BooksController < ApplicationController
  def index
    @books = Book.all
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

  private

  def book_params
    params.require(:book).permit(:name,:genre, :preview, :cover_url, :illustrator, :scenarist, :description, :date, :user_id)
  end
end
