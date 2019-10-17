class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: { scope: [:artist_name, :release_year] }
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, if: -> { released? || release_year.present? }
    validates :artist_name, presence: true
end
