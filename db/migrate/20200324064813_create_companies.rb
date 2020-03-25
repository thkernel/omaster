class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :fax
      t.string :po_box
      t.string :city
      t.string :country
      t.string :website
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
