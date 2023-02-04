# == Schema Information
#
# Table name: comments
#
#  id               :bigint           not null, primary key
#  text             :string           not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  book_contents_id :uuid             not null
#  user_id          :uuid             not null
#
# Indexes
#
#  index_comments_on_book_contents_id  (book_contents_id)
#  index_comments_on_user_id           (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (book_contents_id => book_contents.id)
#  fk_rails_...  (user_id => users.id)
#
class Comment < ApplicationRecord
  self.table_name = 'comments'

  belongs_to :book_content, class_name: Book.name
  belongs_to :user, class_name: User.name
end
