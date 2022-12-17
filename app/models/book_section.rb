# == Schema Information
#
# Table name: book_sections
#
#  id            :uuid             not null, primary key
#  length        :integer          not null
#  section_title :string
#  sequence      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  book_id       :uuid             not null
#
# Indexes
#
#  index_book_sections_on_book_id  (book_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#
class BookSection < ApplicationRecord
  self.table_name = 'book_sections'

  belongs_to :book, class_name: Book.name
  has_many :book_contents, class_name: BookContent.name

  # Validations
  validates :length, presence: true

  def next_section
    next_section = BookSection.find_by(book_id: self.book_id, sequence: self.sequence + 1)
    self.errors.add(:section, 'Requested section does not exist.') if next_section.nil?
    # how do I throw error at model level
    next_section
  end

  def previous_section
    previous_section = BookSection.find_by(book_id: self.book_id, sequence: self.sequence - 1)
    self.errors.add(:section, 'Requested section does not exist.') if previous_section.nil?
    # how do I throw error at model level
    previous_section
  end

  def progress
    book          = self.book
    section_count = book.book_sections.count
    sequence      = self.sequence

    progress = (sequence.to_f / section_count.to_f).round(2) * 100
    progress.to_int
  end
end
