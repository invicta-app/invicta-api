class BookSection < ApplicationRecord
  self.table_name = 'book_sections'

  belongs_to :book_volume, class_name: Book.name
  has_many :book_contents, class_name: BookContent.name
end