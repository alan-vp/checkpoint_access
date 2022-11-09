class Company < ApplicationRecord
  has_many :company_vehicles, dependent: :destroy
  has_many :entrances
  has_many :exits
  validates :name, presence: true
end
