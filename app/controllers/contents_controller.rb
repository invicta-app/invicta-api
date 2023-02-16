class ContentsController < ApplicationController
  before_action :get_metadata, :authenticate_user!

  def handle_bookmark
    if @metadata.content_bookmarks.include?(@content.id)
      remove_bookmark
      bookmarked = false
    else
      add_bookmark
      bookmarked = true
    end

    render turbo_stream:
             turbo_stream.replace(
               @content.id,
               partial: "sections/bookmark",
               locals:  {
                 content:    @content,
                 bookmarked: bookmarked,
                 disabled:   false
               }
             )
  end

  private

  def add_bookmark
    @content.bookmark_count += 1
    @content.save!
    @book.bookmark_count += 1
    @book.save!

    @metadata.add_bookmark(@content.id)
  end

  def remove_bookmark
    @content.bookmark_count -= 1
    @content.save!
    @book.bookmark_count -= 1
    @book.save!

    @metadata.remove_bookmark(@content.id)
  end

  def get_metadata
    @user     = current_user
    @content  = BookContent.find(params[:content_id])
    @section  = BookSection.find(@content.book_section_id)
    @book     = Book.find(@section.book_id)
    @metadata = UserBookMetadata.find_by(book: @book, user: @user)
  end
end
