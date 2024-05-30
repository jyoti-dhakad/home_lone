class LoanApplication < ApplicationRecord
  belongs_to :user
  
  has_many :enquiries

  enum status: { pending: 0, cancelled: 1, approved: 2 }
end
