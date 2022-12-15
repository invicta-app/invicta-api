# == Schema Information
#
# Table name: book_contents
#
#  id              :uuid             not null, primary key
#  content_type    :string           not null
#  metadata        :json
#  sequence        :integer          not null
#  text            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  book_section_id :uuid             not null
#
# Indexes
#
#  index_book_contents_on_book_section_id  (book_section_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_section_id => book_sections.id)
#
class BookContent < ApplicationRecord
  self.table_name = 'book_contents'
  has_one :book_section, class_name: BookSection.name
end
