class Habitat < ApplicationRecord
    has_many :animal_habitats, dependent: :destroy
    has_many :animals, through: :animal_habitats
  
    validates :name, presence: true
  end
  