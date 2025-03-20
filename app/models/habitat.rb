class Habitat < ApplicationRecord
  has_many :animal_habitats, dependent: :destroy
  has_many :animals, through: :animal_habitats

  # Validations for Habitat
  validates :name, presence: true
  validates :location, presence: true
  validates :description, presence: true
end
