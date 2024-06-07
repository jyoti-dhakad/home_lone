# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }


  content title: proc { I18n.t("active_admin.dashboard") } do
    columns do
      
      column do

        panel "About Us" do
          div do
            "#{AboutU.last.content}"
          end
        end

        panel "Registered Users" do
          div do
            "Total Users: #{User.count}"
          end
        end

        panel "New users" do
          div do
            "New users: #{User.where(status: 'pending').count}"
          end
        end

        panel "Approved Users" do
          div do
            "Total Users: #{User.where(status: 'approved').count}"
          end
        end

        panel "rejected Users" do
          div do
            "Total Users: #{User.where(status: 'cancelled').count}"
          end
        end


        panel "New Loan Applications" do
          div do
            "New Loan Applications: #{LoanApplication.where(status: 'pending').count}"
          end
        end

        panel "Approved Loan Applications" do
          div do
            "Approved Loan Applications: #{LoanApplication.where(status: 'approved').count}"
          end
        end

        panel "Rejected Loan Applications" do
          div do
            "Rejected Loan Applications: #{LoanApplication.where(status: 'cancelled').count}"
          end
        end

        panel "Unread Enquiries" do
          div do
            "Unread Enquiries: #{Enquiry.where(status: 'Unread').count}"
          end
        end

        panel "Read Enquiries" do
          div do
            "Read Enquiries: #{Enquiry.where(status: 'Read').count}"
          end
        end

        panel "Contact Us" do
          div do
            simple_format("Phone number: #{ContactU.last.phone}\n\nEmail: #{ContactU.last.email}\n\n Address: #{ContactU.last.address}")
          end
        end
      end
    end
  end
end