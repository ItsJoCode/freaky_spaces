class Place < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :descrition, presence: true
  validates :capacity, presence: true
  validates :price_per_day, presence: true
end
