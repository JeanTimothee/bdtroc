class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :content, presence: true, allow_blank: false
  validates :content, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
end
