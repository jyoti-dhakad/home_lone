class LoanApplication < ApplicationRecord
  belongs_to :user
  
  has_many :enquiries
  has_many :notifications, as: :notifiable

  enum status: { pending: 0, cancelled: 1, approved: 2 }

  validates :amount, :year, :application_number,  presence: true
  after_update :notify_user, if: :saved_change_to_status?
  private

  def notify_user
    if status == "approved"
      Notification.create(
        user: self.user,
        notifiable: self,
        message: "Your loan application has been approved.",
        read: false
      )
    end
  end
end
