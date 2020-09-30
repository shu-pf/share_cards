class MusicCard < ApplicationRecord
  has_one_attached :card_img
  has_many :musics
  has_many :license_groups

  validates :title, presence: true
  validates :artist_name, presence: true
end
