class CreateAnimals < ActiveRecord::Migration[7.2]
  def change
    create_table :animals do |t|
      t.string :common_name
      t.string :scientific_name
      t.text :description
      t.string :classification

      t.timestamps
    end
  end
end
