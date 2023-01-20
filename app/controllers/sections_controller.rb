class SectionsController < ApplicationController
  before_action :fetch_book, :fetch_section

  def show
    params      = show_params
    content     = params[:content]
    end_content = params[:end_content] || params[:content]

    @contents  = BookContent.where(book_section_id: @section.id)
    @contents  = @contents.where(sequence: content..end_content) if content.present?
    @bookmarks = @section.get_bookmarks(current_user)
  end

  private

  def show_params
    params.require([:book_id, :id])
    params.permit(:book_id, :id, :content, :end_content)
  end

  def fetch_book
    @book = Book.find_by(id: params[:book_id])
  end

  def fetch_section
    @section = BookSection.find_by(id: params[:id], book_id: params[:book_id])
  end
end