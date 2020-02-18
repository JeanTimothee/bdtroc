class PagesController < ApplicationController
  def home
    @books = Book.all
  end
end
