class Comment < ApplicationRecord
  self.table_name = 'comments'

  belongs_to :book_content, class_name: Book.name
  belongs_to :user, class_name: User.name
end