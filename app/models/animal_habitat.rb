class AnimalHabitat < ApplicationRecord
  belongs_to :animal
  belongs_to :habitat

  validates :animal_id, uniqueness: { scope: :habitat_id, message: "This animal is already associated with this habitat." }
end
