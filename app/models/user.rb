class User < ApplicationRecord
	has_secure_password

	has_many :gossips
	belongs_to :city
	has_many :comments
	has_many :likes
	validates :name, presence: true
	validates :first_name, presence: true
	validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please"}
	validates :password, presence: true, length: { minimum: 6 }
end
