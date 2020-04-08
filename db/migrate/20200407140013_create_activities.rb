class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :network_nature
      t.string :designation
      t.string :customer_number
      t.string :pont_head
      t.float :debit
      t.float :credit
      t.string :status
      t.references :importation, foreign_key: true
      #t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
