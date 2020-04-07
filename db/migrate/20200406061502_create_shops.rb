class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|
      t.references :locality, foreign_key: true
      t.string :name
      t.string :phone_number
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
