class CreateVolumes < ActiveRecord::Migration[7.0]
  def change
    create_table :volumes, id: :uuid do |t|
      t.string :title, null: false
      t.string :language
      t.string :author
      t.string :subjects, array: true
      t.string :publisher
      t.string :description
      t.string :date_published
      t.string :rights
      t.string  :length_unit, null: true
      t.integer :length, null: true
      t.jsonb :identifiers, null: false
      t.json :contributors, null: true

      t.timestamps
    end
  end
end
