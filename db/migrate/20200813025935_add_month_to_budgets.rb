class AddMonthToBudgets < ActiveRecord::Migration[5.2]
  def change
    add_column :budgets, :month, :string
  end
end
