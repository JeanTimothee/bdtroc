class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user

  validates :content, presence: true, allow_blank: false
end
