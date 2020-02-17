class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :genre
      t.string :cover_url
      t.string :illustrator
      t.string :scenarist
      t.date :date
      t.references :user, null: false, foreign_key: true
      t.string :description
      t.string :preview

      t.timestamps
    end
  end
end
