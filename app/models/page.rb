class Page < ApplicationRecord
  belongs_to :user
  has_many :spots, dependent: :destroy, inverse_of: :page
  accepts_nested_attributes_for :spots, allow_destroy: true, reject_if: :all_blank

  validates :page_title, presence: true

  validates_associated :spots
end
