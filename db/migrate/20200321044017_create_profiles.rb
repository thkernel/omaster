class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :address
      t.string :phone
      t.string :country
      t.string :city
      t.text :about

      t.timestamps
    end
  end
end
