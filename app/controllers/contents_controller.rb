class ContentsController < ApplicationController
  before_action :get_metadata
  before_action :authenticate_user!, only: [:add_bookmark, :remove_bookmark]

  def add_bookmark
    @content.bookmarks += 1
    @content.save!
    @metadata.add_bookmark(@content.id)

    head :ok, status: 201
  end

  def remove_bookmark
    @content.bookmarks -= 1
    @content.save!
    @metadata.remove_bookmark(@content.id)

    head :ok, status: 201
  end

  private

  def get_metadata
    @user     = current_user
    @content = BookContent.find(params[:content_id])
    @section  = BookSection.find(@content.book_section_id)
    @book     = Book.find(@section.book_id)
    @metadata = UserBookMetadata.find_by(book: @book, user: @user)
  end
end
