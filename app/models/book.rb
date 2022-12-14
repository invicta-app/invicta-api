# == Schema Information
#
# Table name: books
#
#  id             :uuid             not null, primary key
#  title          :string           not null
#  language       :string
#  author         :string
#  subjects       :string           is an Array
#  publisher      :string
#  description    :string
#  date_published :string
#  rights         :string
#  length_unit    :string
#  length         :integer
#  identifiers    :jsonb            not null
#  contributors   :json
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Book < ApplicationRecord
  self.table_name = 'books'

  has_many :book_sections, class_name: BookSection.name

  # Validations
  validates :title, presence: true
end
