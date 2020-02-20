class Book < ApplicationRecord

  belongs_to :user
  has_many :reviews
  has_many :bookings
  has_one_attached :cover
  has_many_attached :previews

  validates :name, :illustrator, :scenarist, :description, :cover, :previews, presence: true

  include PgSearch::Model
  pg_search_scope :search_by_name_illustrator_scenarist_description,
    against: [:name, :illustrator, :scenarist, :description],
    using: {
      tsearch: { prefix: true }
    }
end
