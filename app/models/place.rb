class Place < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  validates :name, presence: true
  validates :description, presence: true
  validates :capacity, presence: true
  validates :price_per_day, presence: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :global_search,
    against: %i[name description address],
    associated_against: {
      user: %i[first_name last_name]
    },
    using: {
      tsearch: { prefix: true }
    }
end
