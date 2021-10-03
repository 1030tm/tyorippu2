class Spot < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  belongs_to :page

  validates :spot_name, presence: true
  validates :spot_address, presence: true
  validates :category_id, numericality: { other_than: 0 }
  
end
