class CreatePurchases < ActiveRecord::Migration[5.2]
  def change
    create_table :purchases do |t|
      t.float :amount
      t.string :date
      t.integer :budget_id
    end
  end
end
