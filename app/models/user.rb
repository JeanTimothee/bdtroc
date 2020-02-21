class User < ApplicationRecord
  has_many :books, dependent: :destroy
  has_many :bookings, dependent: :destroy
  geocoded_by :address
  has_one_attached :avatar
  after_validation :geocode, if: :will_save_change_to_address?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
