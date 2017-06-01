class Treasure < ApplicationRecord
  DEFAULT_DISTANCE = 5

  geocoded_by :address
  after_validation :geocode

  has_and_belongs_to_many :hunters, -> { uniq }

  def required_distance
    DEFAULT_DISTANCE
  end
end
