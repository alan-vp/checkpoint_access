class AddCompanyRefToEntrances < ActiveRecord::Migration[7.0]
  def change
    add_reference :entrances, :company, foreign_key: true
  end
end
