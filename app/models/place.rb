class Place < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, presence: true
  validates :capacity, presence: true
  validates :price_per_day, presence: true
end
