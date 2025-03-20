class AddImageUrlToAnimals < ActiveRecord::Migration[7.2]
  def change
    add_column :animals, :image_url, :string
  end
end
