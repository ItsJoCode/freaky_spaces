class DeleteColumnsToPlaces < ActiveRecord::Migration[7.0]
  def change
    remove_column :places, :country
    remove_column :places, :district
    remove_column :places, :city
    remove_column :places, :zip_code
  end
end
