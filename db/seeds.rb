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
    location: row['Location'],
    latitude: row['Latitude'].presence || Faker::Address.latitude,
    longitude: row['Longitude'].presence || Faker::Address.longitude
  )
end
puts "Imported #{Habitat.count} habitats."

# Assign each animal to 1-3 random habitats
Animal.find_each do |animal|
  random_habitats = Habitat.order("RANDOM()").limit(rand(1..3))
  random_habitats.each do |habitat|
    AnimalHabitat.create!(animal: animal, habitat: habitat)
  end
end

puts "Assigned habitats to animals."

# Optionally seed observations using Faker
Animal.find_each do |animal|
  rand(1..3).times do
    Observation.create!(
      observer_name: Faker::Name.name,
      notes: Faker::Lorem.sentence,
      observed_at: Faker::Time.backward(days: 1000),
      animal: animal
    )
  end
end
