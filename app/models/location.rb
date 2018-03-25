class Location < ApplicationRecord
  validates :address, presence: true
  validates :high, presence: true
end
