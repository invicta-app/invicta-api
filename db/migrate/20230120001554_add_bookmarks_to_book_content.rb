class AddBookmarksToBookContent < ActiveRecord::Migration[7.0]
  def change
    add_column :book_contents, :get_bookmarks, :integer, default: 0, null: false
  end
end
