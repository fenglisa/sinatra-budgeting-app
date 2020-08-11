class CreateBudgets < ActiveRecord::Migration[5.2]
  def change
    create_table :budgets do |t|
      t.string :name
      t.float :goal
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
