class User < ApplicationRecord
    has_many :lists, dependent: :destroy
    has_many :items, through: :lists

    validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, uniqueness: true, allow_blank: true
    validates_uniqueness_of :email
    validates_confirmation_of :password

    has_secure_password
end
