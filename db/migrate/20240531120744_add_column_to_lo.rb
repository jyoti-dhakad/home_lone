class AddColumnToLo < ActiveRecord::Migration[6.1]
  def change
    add_column :loan_applications, :emi, :integer
    add_column :loan_applications, :interest, :integer
    add_column :loan_applications, :total_loan, :integer
    add_column :loan_applications, :year, :integer

  end
end
