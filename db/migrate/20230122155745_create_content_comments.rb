class CreateContentComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.belongs_to :book_contents, type: :uuid, foreign_key: true, null: false
      t.belongs_to :user, type: :uuid, foreign_key: true, null: false

      t.string :text, null: false

      t.timestamps
    end

    add_column :book_contents, :comment_count, :integer, default: 0, null: false
  end
end
