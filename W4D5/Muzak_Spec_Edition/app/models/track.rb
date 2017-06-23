class Track < ApplicationRecord
  validates :album, presence: true, uniqueness: { scope: :ord }
  validates :name, :lyrics, presence: true

  belongs_to :album
end
