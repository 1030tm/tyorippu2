class Spot < ApplicationRecord
  belongs_to :page

  validates :spot_name, presence: true
  validates :spot_address, presence: true
  validates :spot_parking, presence: true
end
