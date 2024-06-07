ActiveAdmin.register_page "Disbursed Loans" do
    menu parent: "Loans"
  
    content title: "Disbursed Loans" do
      columns do
        column do
          panel "Disbursed Loans" do
            table_for LoanApplication.where(status: 'approved') do
              column :id
              
              column :amount
              column :status
              column :user
              column :emi
              column :interest
              column :total_loan
              column :year
            end
          end
        end
      end
    end
  end