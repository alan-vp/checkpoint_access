class Entrance < ApplicationRecord
  belongs_to :user
  belongs_to :company_vehicle
end
