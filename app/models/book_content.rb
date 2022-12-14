# == Schema Information
#
# Table name: book_contents
#
#  id              :bigint           not null, primary key
#  book_section_id :uuid             not null
#  text            :string
#  content_type    :string           not null
#  length          :integer          not null
#  sequence        :integer          not null
#  metadata        :json
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class BookContent < ApplicationRecord
  self.table_name = 'book_contents'
  has_one :book_section, class_name: BookSection.name
end
