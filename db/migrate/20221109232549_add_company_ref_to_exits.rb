class AddCompanyRefToExits < ActiveRecord::Migration[7.0]
  def change
    add_reference :exits, :company, foreign_key: true
  end
end
