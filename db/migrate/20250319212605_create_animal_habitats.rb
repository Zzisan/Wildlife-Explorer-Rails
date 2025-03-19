class CreateAnimalHabitats < ActiveRecord::Migration[7.2]
  def change
    create_table :animal_habitats do |t|
      t.references :animal, null: false, foreign_key: true
      t.references :habitat, null: false, foreign_key: true

      t.timestamps
    end
  end
end
