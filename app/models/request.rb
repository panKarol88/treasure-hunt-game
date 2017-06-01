class Request < ApplicationRecord
  belongs_to :hunter
  belongs_to :treasure

  scope :in_past_an_hour_for, -> (hunter) { where(hunter: hunter).where("created_at >= ?",Time.now-1.hour) }
  scope :in_time_between, -> (start_date, end_date) { where("created_at BETWEEN ? AND ?", start_date,end_date) }
  scope :in_radius, -> (treasure, radius) { where("latitude BETWEEN ? AND ? AND longitude BETWEEN ? AND ?",
      bounding_box(treasure, radius)[0],bounding_box(treasure, radius)[2],
      bounding_box(treasure, radius)[1],bounding_box(treasure, radius)[3]) }

  def self.bounding_box(treasure, radius)
    Geocoder::Calculations.bounding_box([treasure.latitude, treasure.longitude], radius)
  end
end
