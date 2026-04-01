class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.decimal :old_price
      t.string :badge
      t.string :badge_color
      t.string :image_url
      t.text :colors
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
