class CreateHeadPonts < ActiveRecord::Migration[5.2]
  def change
    create_table :head_ponts do |t|
      t.references :head_pont_type, foreign_key: true
      t.string :number
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
