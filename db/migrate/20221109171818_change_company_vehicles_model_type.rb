class ChangeCompanyVehiclesModelType < ActiveRecord::Migration[7.0]
  def change
    change_column :company_vehicles, :model, :string
  end
end
