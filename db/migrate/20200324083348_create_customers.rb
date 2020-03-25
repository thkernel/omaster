class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.references :customer_type, foreign_key: true
      t.string :company_name
      t.string :contact_name
      t.string :address
      t.string :personal_phone
      t.string :work_phone
      t.string :fleet_number
      t.string :city
      t.string :country
      t.string :email
      t.references :agent, foreign_key: true
      t.references :user, foreign_key: true
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
