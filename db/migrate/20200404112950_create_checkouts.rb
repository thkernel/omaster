class CreateCheckouts < ActiveRecord::Migration[5.2]
  def change
    create_table :checkouts do |t|
      t.string :uid
      t.string :name
      t.float :minimum_balance
      t.float :maximum_balance
      t.string :current_balance
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
