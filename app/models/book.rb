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
  has_many :book_contents, through: :book_sections
  has_many :user_book_metadatas

  # Validations
  validates :title, presence: true

  ### Instance Methods
  def get_user_section(user)
    metadata = user.user_book_metadatas.find_by(book: self)

    if metadata.blank?
      Book.get_first_section!(self)
    else
      BookSection.find(metadata.current_section_id)
    end
  end

  def create_user_metadata!(user)
    UserBookMetadata.create!(
      book:               self,
      user:               user,
      current_section_id: section.id
    )
  end

  ### Class Methods
  class << self
    def get_first_section!(book)
      BookSection.find_by!(book: book, sequence: 0)
    end
  end
end
