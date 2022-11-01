class Entrance < ApplicationRecord
  belongs_to :user
  belongs_to :company_vehicle
  validates :user_id, :date, :time, :first_name, :last_name, :destination, :mileage, :company_vehicle_id, presence: true
  validates :mileage, numericality: { only_integer: true }
end
