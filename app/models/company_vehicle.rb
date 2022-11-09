class CompanyVehicle < ApplicationRecord
  belongs_to :company
  has_many :entrances
  has_many :exits
  validates :brand, :model, :license_plate, :company_id, presence: true
end
