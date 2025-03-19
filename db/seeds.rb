require 'faker'

# Create Habitats
5.times do
  Habitat.create!(
    name: Faker::Creature::Animal.unique.name,
    description: Faker::Lorem.sentence,
    location: Faker::Address.country
  )
end

# Create Animals and associate them with habitats and observations
20.times do
  animal = Animal.create!(
    common_name: Faker::Creature::Animal.name,
    scientific_name: Faker::Lorem.word.capitalize + " " + Faker::Lorem.word.capitalize,
    description: Faker::Lorem.paragraph,
    classification: ["Mammal", "Bird", "Reptile", "Fish", "Amphibian"].sample
  )

  # Associate 1-3 random habitats with each animal
  Habitat.order('RANDOM()').limit(rand(1..3)).each do |habitat|
    AnimalHabitat.create!(animal: animal, habitat: habitat)
  end

  # Create 1-5 observations per animal
  rand(1..5).times do
    Observation.create!(
      observer_name: Faker::Name.name,
      notes: Faker::Lorem.sentence,
      observed_at: Faker::Time.backward(days: 1000),
      animal: animal
    )
  end
end
