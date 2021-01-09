class CreateDrinks < ActiveRecord::Migration[5.2]
  def change
    create_table :drinks do |t|
    	t.text "drink_name", null: false
      t.string "image_id", null: false
      t.text "body", null: false
      t.integer "genre_id", null: false
      t.timestamps
    end
  end
end
