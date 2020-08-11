class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.float :amount
      t.string :date
      t.integer :budget_id

      t.timestamps null: false
    end
  end
end
