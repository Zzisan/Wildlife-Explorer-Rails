require 'csv'

# Clear out old data
Animal.destroy_all
Habitat.destroy_all
AnimalHabitat.destroy_all
Observation.destroy_all

puts "Importing animals from #{Rails.root.join('db', 'data', 'animals.csv')}..."
CSV.foreach(Rails.root.join('db', 'data', 'animals.csv'), headers: true) do |row|
  # Capitalize each word in the common name and scientific name
  common_name = row['Common Name'].to_s.split.map(&:capitalize).join(" ")
  scientific_name = row['Scientific Name'].to_s.split.map(&:capitalize).join(" ")
  
  Animal.create!(
    common_name: common_name,
    scientific_name: scientific_name,
    description: row['Description'],
    classification: row['Classification']
  )
end
puts "Imported #{Animal.count} animals from CSV."

# Import habitats from CSV, using Faker for missing coordinates
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
puts "Imported #{Habitat.count} habitats from CSV."

# Add additional fake animals - increase the count (e.g., 20 additional animals)
20.times do
  animal_name = Faker::Creature::Animal.name.split.map(&:capitalize).join(" ")
  Animal.create!(
    common_name: animal_name,
    scientific_name: Faker::Science.element.capitalize, # You can customize this further if needed
    description: Faker::Lorem.paragraph(sentence_count: 2),
    classification: ["Mammal", "Bird", "Reptile", "Fish", "Amphibian"].sample
  )
end
puts "Added additional fake animals. Total animals: #{Animal.count}"

# Similarly, add additional fake habitats if desired (e.g., 10 additional habitats)
10.times do
  Habitat.create!(
    name: Faker::Address.unique.community,
    description: Faker::Lorem.sentence,
    location: Faker::Address.country,
    latitude: Faker::Address.latitude,
    longitude: Faker::Address.longitude
  )
end
puts "Added additional fake habitats. Total habitats: #{Habitat.count}"

# Assign each animal to 1-3 random habitats
Animal.find_each do |animal|
  Habitat.order("RANDOM()").limit(rand(1..3)).each do |habitat|
    AnimalHabitat.create!(animal: animal, habitat: habitat)
  end
end
puts "Assigned habitats to animals."

# Create observations for each animal; increase the number for more data
Animal.find_each do |animal|
  rand(2..5).times do
    Observation.create!(
      observer_name: Faker::Name.name,
      notes: Faker::Lorem.sentence(word_count: rand(6..12)),
      observed_at: Faker::Time.backward(days: 1000),
      animal: animal
    )
  end
end
puts "Created observations for animals. Total observations: #{Observation.count}"
