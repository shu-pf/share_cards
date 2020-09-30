class LicenseGroup < ApplicationRecord
  has_many :licenses
  belongs_to :card
  belongs_to :music_card

  validates :number_of_licenses, presence: true
end
