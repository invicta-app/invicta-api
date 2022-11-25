class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections, id: :uuid, default: -> { "uuid_generate_v1mc()" } do |t|
      t.belongs_to :volume, type: :uuid, foreign_key: true, null: false
      t.string :section_title, null: true
      t.string :section_type, null: true
      t.string :content, null: false
      t.integer :sequence, null: true

      t.timestamps
    end
  end
end
