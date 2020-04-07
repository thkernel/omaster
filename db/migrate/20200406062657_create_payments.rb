class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :uid
      t.references :send_unit_value, foreign_key: true
      t.references :payment_type, foreign_key: true
      t.references :checkout, foreign_key: true
      t.float :amount
      t.integer :shop_id
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
