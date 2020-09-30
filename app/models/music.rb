class Music < ApplicationRecord
  has_one_attached :music

  validates :title, presence: true
  validates :music, presence: true
  validates :artist_name, presence: true
end
