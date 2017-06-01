class Treasure < ApplicationRecord
  geocoded_by :address
  after_validation :geocode

  has_and_belongs_to_many :hunters, -> { uniq }
end
