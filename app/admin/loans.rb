ActiveAdmin.register_page "Disbursed Loans" do
    menu parent: "Loan"
  
    content title: "Disbursed Loans" do
      columns do
        column do
          panel "Disbursed Loans" do
            table_for LoanApplication.where(status: 'approved') do
              column :id
              column :start_date
              column :end_date
              column :amount
              column :status
              column :user
            end
          end
        end
      end
    end
  end