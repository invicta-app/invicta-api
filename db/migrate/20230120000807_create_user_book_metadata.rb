class CreateUserBookMetadata < ActiveRecord::Migration[7.0]
  def change
    create_table :user_book_metadata, id: :uuid do |t|
      t.belongs_to :book, type: :uuid, foreign_key: true, null: false
      t.belongs_to :user, type: :uuid, foreign_key: true, null: false

      t.references :current_section, type: :uuid, foreign_key: { to_table: :book_sections }
      t.string :content_bookmarks, array: true, default: [], null: false

      t.timestamps
    end
  end
end
