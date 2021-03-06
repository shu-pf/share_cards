class Card < ApplicationRecord
  has_one_attached :content
  has_one_attached :card_img
  has_many :license_groups

  validates :title, presence: true
  validates :auther_name, presence: true
  validates :content, presence: true
end
