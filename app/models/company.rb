class Company < ApplicationRecord
  has_many :company_vehicles, dependent: :destroy
  validates :name, presence: true
end
