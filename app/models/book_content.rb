class BookContent < ApplicationRecord
  has_one :book_section, class_name: BookSection.name

end