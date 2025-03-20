class Animal < ApplicationRecord
  has_many :observations, dependent: :destroy
  has_many :animal_habitats, dependent: :destroy
  has_many :habitats, through: :animal_habitats

  # Validations for Animal
  validates :common_name, presence: true
  validates :scientific_name, presence: true
  validates :description, presence: true
  validates :classification, presence: true
end
