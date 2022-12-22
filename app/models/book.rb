# == Schema Information
#
# Table name: books
#
#  id             :uuid             not null, primary key
#  author         :string
#  content_count  :integer          not null
#  contributors   :json
#  date_published :string
#  description    :string
#  identifiers    :jsonb            not null
#  language       :string
#  length         :integer
#  length_unit    :string
#  publisher      :string
#  rights         :string
#  subjects       :string           is an Array
#  title          :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Book < ApplicationRecord
  self.table_name = 'books'

  has_many :book_sections, class_name: BookSection.name, dependent: :destroy

  # Validations
  validates :title, presence: true
end
