class Company < ApplicationRecord
  has_many :company_vehicles, dependent: :destroy
end
