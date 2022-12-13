class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :book_sections, id: :uuid do |t|
      t.belongs_to :book, type: :uuid, foreign_key: true, null: false # TODO change to book_id
      t.string :section_title, null: true
      t.integer :sequence, null: true
      t.integer :length, null: false

      t.timestamps
    end
  end
end
