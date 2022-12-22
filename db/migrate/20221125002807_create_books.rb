class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books, id: :uuid do |t|
      t.string :title, null: false
      t.string :language
      t.string :author
      t.string :subjects, array: true
      t.string :publisher
      t.string :description
      t.string :date_published
      t.string :rights
      t.string :length_unit, null: true
      t.integer :length, null: true
      t.integer :content_count, null: false
      t.jsonb :identifiers, null: false
      t.json :contributors, null: true

      t.timestamps
    end
  end
end
