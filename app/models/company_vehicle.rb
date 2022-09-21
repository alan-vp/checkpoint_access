class CompanyVehicle < ApplicationRecord
  belongs_to :company
  has_many :entrances, dependent: :destroy
  has_many :exits, dependent: :destroy
end
