class CreateCompanyVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :company_vehicles do |t|
      t.string :brand
      t.integer :model
      t.string :license_plate
      t.references :company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
