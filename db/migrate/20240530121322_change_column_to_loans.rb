class ChangeColumnToLoans < ActiveRecord::Migration[6.1]
  def change
    change_column :loan_applications, :amount, :float
  end
end
