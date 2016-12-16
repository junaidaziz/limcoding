class CreatePageContents < ActiveRecord::Migration
  def change
    create_table :page_contents do |t|
      t.references :page, index: true, foreign_key: true
      t.string :h1, array: true
      t.string :h2, array: true
      t.string :h3, array: true
      t.string :links, array: true

      t.timestamps null: false
    end
  end
end
