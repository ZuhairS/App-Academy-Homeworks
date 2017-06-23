class Album < ApplicationRecord
  validates :band, presence: true, uniqueness: { scope: :name }
  validates :year, presence: true

  belongs_to :band
  has_many :tracks,
    dependent: :destroy
end
