class CreateRemoteUnitValues < ActiveRecord::Migration[5.2]
  def change
    create_table :remote_unit_values do |t|
      t.string :uid
      t.string :sender
      t.string :receiver
      t.float :amount
      #t.references :shop, foreign_key: true
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
