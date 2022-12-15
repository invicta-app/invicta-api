# == Schema Information
#
# Table name: book_sections
#
#  id            :uuid             not null, primary key
#  book_id       :uuid             not null
#  section_title :string
#  sequence      :integer
#  length        :integer          not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class BookSection < ApplicationRecord
  self.table_name = 'book_sections'

  belongs_to :book, class_name: Book.name
  has_many :book_contents, class_name: BookContent.name

  # Validations
  validates :length, presence: true
end
