class Enquiry < ApplicationRecord
  belongs_to :user
  belongs_to :loan_application

  enum status: { Unread: 0, Read: 1 }
  validates :message, presence: true
end
