class Book < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bookings
  has_one_attached :cover
  has_many_attached :previews

  validates :name, :illustrator, :scenarist, :description, :cover, :previews, presence: true
end
