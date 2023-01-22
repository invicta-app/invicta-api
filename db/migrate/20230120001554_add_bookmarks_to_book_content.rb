class AddBookmarksToBookContent < ActiveRecord::Migration[7.0]
  def change
    add_column :book_contents, :bookmark_count, :integer, default: 0, null: false
    add_column :books, :bookmark_count, :integer, default: 0, null: false
  end
end
