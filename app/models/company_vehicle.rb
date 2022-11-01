class CompanyVehicle < ApplicationRecord
  belongs_to :company
  has_many :entrances, dependent: :destroy
  has_many :exits, dependent: :destroy
  validates :brand, :model, :license_plate, :company_id
end
