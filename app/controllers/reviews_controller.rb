class ReviewsController < ApplicationController
  def new
    @book = Book.find(params[:book_id])
    @review = Review.new
  end

  def create
    @review = Review.new(params[:content])
    @book = Book.find(params[:book_id])
    @review.book = @book
    @review.save

    redirect_to book_path(@book)
  end
end
