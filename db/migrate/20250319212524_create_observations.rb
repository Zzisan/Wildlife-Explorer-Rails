class CreateObservations < ActiveRecord::Migration[7.2]
  def change
    create_table :observations do |t|
      t.string :observer_name
      t.text :notes
      t.datetime :observed_at
      t.references :animal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
