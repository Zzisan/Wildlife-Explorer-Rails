require 'csv'

# Clear out old data
Animal.destroy_all
Habitat.destroy_all
AnimalHabitat.destroy_all

puts "Importing animals from #{Rails.root.join('db', 'data', 'animals.csv')}..."
CSV.foreach(Rails.root.join('db', 'data', 'animals.csv'), headers: true) do |row|
  Animal.create!(
    common_name: row['Common Name'],
    scientific_name: row['Scientific Name'],
    description: row['Description'],
    classification: row['Classification']
  )
end
puts "Imported #{Animal.count} animals."

puts "Importing habitats from #{Rails.root.join('db', 'data', 'habitats.csv')}..."
CSV.foreach(Rails.root.join('db', 'data', 'habitats.csv'), headers: true) do |row|
  Habitat.create!(
    name: row['Name'],
    description: row['Description'],
    location: row['Location']
  )
end
puts "Imported #{Habitat.count} habitats."

# Associate each animal with 1 to 3 random habitats
Animal.find_each do |animal|
  # Get a random number of habitats (between 1 and 3) for this animal
  habitats = Habitat.order("RANDOM()").limit(rand(1..3))
  habitats.each do |habitat|
    AnimalHabitat.create!(animal: animal, habitat: habitat)
  end
end

puts "Assigned habitats to animals."
