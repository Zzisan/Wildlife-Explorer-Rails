class CreateHabitats < ActiveRecord::Migration[7.2]
  def change
    create_table :habitats do |t|
      t.string :name
      t.text :description
      t.string :location

      t.timestamps
    end
  end
end
