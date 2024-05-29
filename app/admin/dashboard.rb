# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    columns do
      column do
        panel "Registered Users" do
          div do
            "Total Users: #{User.count}"
          end
        end

        panel "New Loan Applications" do
          div do
            "New Loan Applications: #{LoanApplication.pending.count}"
          end
        end

        panel "Approved Loan Applications" do
          div do
            "Approved Loan Applications: #{LoanApplication.approved.count}"
          end
        end

        panel "Rejected Loan Applications" do
          div do
            "Rejected Loan Applications: #{LoanApplication.cancelled.count}"
          end
        end

        # panel "Disbursed Loan Applications" do
        #   div do
        #     "Disbursed Loan Applications: #{LoanApplication.disbursed.count}"
        #   end
        # end

        # panel "Unread Enquiries" do
        #   div do
        #     "Unread Enquiries: #{Enquiry.unread.count}"
        #   end
        # end

        # panel "Read Enquiries" do
        #   div do
        #     "Read Enquiries: #{Enquiry.read.count}"
        #   end
        # end
      end
    end
  end # content
end
