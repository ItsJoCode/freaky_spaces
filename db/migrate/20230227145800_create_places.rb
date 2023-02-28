class CreatePlaces < ActiveRecord::Migration[7.0]
  def change
    create_table :places do |t|
      t.string :country
      t.string :district
      t.string :city
      t.integer :zip_code
      t.string :name
      t.text :description
      t.integer :capacity
      t.integer :price_per_day
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
