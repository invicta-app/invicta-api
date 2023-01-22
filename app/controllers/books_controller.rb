class BooksController < ApplicationController
  # before_action :authenticate_user!

  def index
    @books = Book.all.sort_by &:bookmark_count
  end

  def show
    @book = Book.find_by(id: params[:id])
  end
end
