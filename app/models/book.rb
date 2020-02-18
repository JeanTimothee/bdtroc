class Book < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bookings

  validates :name, presence: true
  validates :cover_url, presence: true
  validates :illustrator, presence: true
  validates :scenarist, presence: true
  validates :description, presence: true
end
