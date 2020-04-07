class CreateRemoteNafamas < ActiveRecord::Migration[5.2]
  def change
    create_table :remote_nafamas do |t|
      t.string :uid
      t.float :amount
      t.references :customer, foreign_key: true
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
