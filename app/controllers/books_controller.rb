class BooksController < ApplicationController
  before_action :fetch_book, only: [:show]

  def show
    params      = show_params
    section     = params[:section]
    content     = params[:content]
    end_content = params[:end_content] || params[:content]

    @section = BookSection.find_by(book_id: @book.id, sequence: section)
    @content = BookContent.where(book_section_id: @section.id, sequence: content..end_content)

    normalized_text = @content.pluck(:text).join(' ')

    render html: normalized_text
  end

  private

  def fetch_book
    @book = Book.find_by(id: params[:id])
  end

  def show_params
    params.require([:id, :section, :content])
    params.permit(
      :id,
      :section,
      :content,
      :end_content
    )
  end

end