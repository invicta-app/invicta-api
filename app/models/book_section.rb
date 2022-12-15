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
end
