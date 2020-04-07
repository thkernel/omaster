class CreatePaymentTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :payment_types do |t|
      t.string :name
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
