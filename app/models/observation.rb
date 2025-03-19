class Observation < ApplicationRecord
  belongs_to :animal

  validates :observer_name, :notes, presence: true
end
