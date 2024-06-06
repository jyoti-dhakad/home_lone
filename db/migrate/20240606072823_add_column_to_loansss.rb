class AddColumnToLoansss < ActiveRecord::Migration[6.1]
  def change
    def up
      # Add the year column allowing NULL
      add_column :loan_applications, :year, :integer, null: false, default: 0
  
     
  
     
    end
  
    def down
      # Revert the changes made in the 'up' method
      remove_column :loan_applications, :year
    end
  end
end
