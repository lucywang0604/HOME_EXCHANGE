class Flat < ApplicationRecord
  belongs_to :user

  has_many :bookings, dependent: :destroy

  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
