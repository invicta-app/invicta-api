class BookCreator < ApplicationService
  def initialize(volume, metadata, table_of_contents)
    @volume            = volume
    @metadata          = metadata
    @table_of_contents = table_of_contents
  end

  def call
    @metadata.delete :section_count

    ActiveRecord::Base.transaction do
      book = Book.create!(@metadata)
      @volume.each { |section| create_section(section, book.id) }
    end
  end

  private

  def create_section(section, book_id)
    contents = section.delete('content')

    @section = BookSection.create!(
      book_id:  book_id,
      title:    section[:title],
      ref_id:   section[:href],
      sequence: section[:section],
      length:   contents.length,
    )

    contents.each { |content| content[:book_section_id] = @section.id }

    @contents = BookContent.create!(contents)
  end
end