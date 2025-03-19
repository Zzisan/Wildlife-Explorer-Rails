class Animal < ApplicationRecord
    has_many :observations, dependent: :destroy
    has_many :animal_habitats, dependent: :destroy
    has_many :habitats, through: :animal_habitats
  
    validates :common_name, :scientific_name, presence: true
  end
  