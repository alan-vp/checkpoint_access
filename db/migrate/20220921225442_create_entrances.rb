class CreateEntrances < ActiveRecord::Migration[7.0]
  def change
    create_table :entrances do |t|
      t.date :date
      t.time :time
      t.string :first_name
      t.string :last_name
      t.string :destination
      t.text :comments
      t.integer :mileage
      t.references :user, null: false, foreign_key: true
      t.references :company_vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
