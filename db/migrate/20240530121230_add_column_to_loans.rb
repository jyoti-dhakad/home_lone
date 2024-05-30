class AddColumnToLoans < ActiveRecord::Migration[6.1]
  def change
    add_column :loan_applications, :application_number, :string
  end
end
