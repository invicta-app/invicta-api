class AddEmojiToBookSections < ActiveRecord::Migration[7.0]
  def change
    add_column :book_sections, :icon, :string
  end
end
