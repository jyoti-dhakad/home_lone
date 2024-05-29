class User < ApplicationRecord
    has_secure_password

    enum status: { pending: 0, cancelled: 1, approved: 2 }
end
