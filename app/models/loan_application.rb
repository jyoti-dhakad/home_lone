class LoanApplication < ApplicationRecord
  belongs_to :user

  enum status: { pending: 0, cancelled: 1, approved: 2 }
end
