class Hunter < ApplicationRecord
  has_secure_password

  has_and_belongs_to_many :treasures, -> { uniq }
end
