class Enquiry < ApplicationRecord
  belongs_to :user
  belongs_to :loan_application
  has_many :notifications, as: :notifiable

  validates :message, presence: true

  VALID_STATUSES = ["unread", "read"]

  validates :status, inclusion: { in: VALID_STATUSES }
  

  after_update :update_status_to_read, if: :saved_change_to_admin_response?
  after_update :notify_user, if: :saved_change_to_status_to_read?

  private

  def notify_user
    
    if status == "read"
      Notification.create(
        user: self.user,
        notifiable: self,
        message: "Your enquiry has a new response from admin.",
        read: false
      )
    end
  end

  def update_status_to_read
    self.update(status: "read") unless status == "read"
  end

  def saved_change_to_status_to_read?
    saved_change_to_status? && status == "read"
  end
end