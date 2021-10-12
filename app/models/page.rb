class Page < ApplicationRecord
  belongs_to :user

  has_many :spots, dependent: :destroy, inverse_of: :page
  accepts_nested_attributes_for :spots, allow_destroy: true, reject_if: :all_blank
  validates_associated :spots

  has_many :likes, dependent: :destroy

  validates :page_title, presence: true

  acts_as_taggable

end
