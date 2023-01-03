class AddActiveToCompanyVehicles < ActiveRecord::Migration[7.0]
  def change
    add_column :company_vehicles, :active, :boolean, default: true
  end
end
