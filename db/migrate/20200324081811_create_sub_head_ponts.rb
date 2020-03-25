class CreateSubHeadPonts < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_head_ponts do |t|
      t.references :sub_head_pont_type, foreign_key: true
      t.string :number
      t.text :description
      t.string :status
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
