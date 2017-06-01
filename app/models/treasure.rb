class Treasure < ApplicationRecord
  DEFAULT_DISTANCE = 5
  DEFAULT_REQUESTS_LIMIT = 20

  geocoded_by :address
  after_validation :geocode

  has_and_belongs_to_many :hunters, -> { uniq }
  has_many :requests

  scope :active, -> { where(active: true) }

  def required_distance
    DEFAULT_DISTANCE
  end

  def requests_limit
    DEFAULT_REQUESTS_LIMIT
  end
end
