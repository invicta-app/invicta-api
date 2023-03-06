class SectionsController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :fetch_book, :fetch_section

  def show
    params = show_params

    find_or_create_metadata
    assign_current_section

    content     = params[:content]
    end_content = params[:end_content] || params[:content]

    @contents  = BookContent.where(book_section_id: @section.id).sort_by(&:sequence)
    @contents  = @contents.where(sequence: content..end_content) if content.present?
    @bookmarks = @section.get_bookmarks(current_user) if current_user
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

  def find_or_create_metadata
    metadata  = UserBookMetadata.find_by(user: current_user, book: @book)

    if metadata.blank?
      metadata = UserBookMetadata.create!(
        book:               @book,
        user:               current_user,
        current_section_id: @section.id
      )
    end
    @metadata = metadata
  end

  def assign_current_section
    @metadata.update!(current_section_id: show_params[:id])
  end

end