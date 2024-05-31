class RemoveColumnToLoan < ActiveRecord::Migration[6.1]
  def change
    remove_column :loan_applications, :start_date
    remove_column :loan_applications, :end_date
  end
end
