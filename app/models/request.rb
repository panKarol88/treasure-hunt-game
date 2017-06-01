class Request < ApplicationRecord
  belongs_to :hunter
  belongs_to :treasure

  scope :in_past_an_hour_for, -> (hunter) { where(hunter: hunter).where("created_at >= ?",Time.now-1.hour) }
end
