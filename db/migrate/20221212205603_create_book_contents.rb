class CreateBookContents < ActiveRecord::Migration[7.0]
  def change
    create_table :book_contents do |t|
      t.belongs_to :book_section, type: :uuid, foreign_key: true, null: false
      t.string :text, null: true # TODO - change to false
      t.string :content_type, null: false
      t.integer :length, null: false
      t.integer :sequence, null: false
      t.json :metadata, null: true

      t.timestamps
    end
  end
end
