class AnimalHabitat < ApplicationRecord
  belongs_to :animal
  belongs_to :habitat
end
