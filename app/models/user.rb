class User < ApplicationRecord
    has_secure_password
    has_one_attached :picture
    
    has_one :loan_application
    has_many :enquiries, through: :loan_application

    enum status: { pending: 0, cancelled: 1, approved: 2 }
end
