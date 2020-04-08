class CreateImportations < ActiveRecord::Migration[5.2]
  def change
    create_table :importations do |t|
      t.string :uid
      t.string :file_name
      t.references :user, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
