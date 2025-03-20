class Observation < ApplicationRecord
  belongs_to :animal

  # Validations for Observation
  validates :observer_name, presence: true
  validates :notes, presence: true
  validates :observed_at, presence: true
end
