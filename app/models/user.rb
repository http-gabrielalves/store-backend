class User < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    validates :address, presence: true
    validates :picture, presence: true
end
