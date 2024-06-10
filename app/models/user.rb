class User < ApplicationRecord
    has_secure_password
    has_one_attached :picture
    
    has_many :loan_application
    has_many :enquiries, through: :loan_application

    enum status: { pending: 0, cancelled: 1, approved: 2 }

    validates :name, :email, :phone_number, presence: true
    validates :date_of_birth, :present_address, :parmanent_address, presence: true
    validates :merital_status, :category, :annual_income, presence: true
        
end