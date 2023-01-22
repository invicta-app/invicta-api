# == Schema Information
#
# Table name: user_book_metadata
#
#  id                 :uuid             not null, primary key
#  content_bookmarks  :string           default([]), not null, is an Array
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  book_id            :uuid             not null
#  current_section_id :uuid
#  user_id            :uuid             not null
#
# Indexes
#
#  index_user_book_metadata_on_book_id             (book_id)
#  index_user_book_metadata_on_current_section_id  (current_section_id)
#  index_user_book_metadata_on_user_id             (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_id => books.id)
#  fk_rails_...  (current_section_id => book_sections.id)
#  fk_rails_...  (user_id => users.id)
#
class UserBookMetadata < ApplicationRecord
  belongs_to :user
  belongs_to :book

  ### Class Methods
  def add_bookmark(content_id)
    return if content_bookmarks.include?(content_id)
    content_bookmarks << content_id
    self.save
  end

  def remove_bookmark(content_id)
    return unless content_bookmarks.include?(content_id)
    content_bookmarks.delete content_id
    self.save
  end
end
