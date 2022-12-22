class CreateBookSections < ActiveRecord::Migration[7.0]
  def change
    create_table :book_sections, id: :uuid do |t|
      t.belongs_to :book, type: :uuid, foreign_key: true, null: false
      t.string :ref_id, null: true
      t.string :section_title, null: true
      t.integer :sequence, null: true
      t.integer :length, null: true
      t.string :section_type, null: true # TODO

      t.timestamps
    end
  end
end
