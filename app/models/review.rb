class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :text, presence: true
end
