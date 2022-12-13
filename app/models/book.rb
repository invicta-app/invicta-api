class Book < ApplicationRecord
  self.table_name = 'books'

  has_many :book_sections, class_name: BookSection.name
end