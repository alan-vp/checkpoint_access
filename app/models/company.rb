class Company < ApplicationRecord
  has_many :company_vehicles, dependent: :destroy
  has_many :entrances
  validates :name, presence: true
end
