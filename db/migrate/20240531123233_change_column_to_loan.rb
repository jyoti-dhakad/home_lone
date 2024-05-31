class ChangeColumnToLoan < ActiveRecord::Migration[6.1]
  def change

    change_column :loan_applications, :amount, :integer
  end
end
