class CreateReturnUnitValues < ActiveRecord::Migration[5.2]
  def change
    create_table :return_unit_values do |t|
      t.string :reason
      t.references :customer, foreign_key: true
      t.float :amount
      t.references :agent, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
