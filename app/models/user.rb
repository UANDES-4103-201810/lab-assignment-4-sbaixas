class User < ApplicationRecord
  	has_many :user_tickets	
	has_many :tickets, :through => :user_tickets
	validates :email, format: { with: /\A[^@\s]+@[^@\s]+\.[^@\s]\z/, on: create }
	validates :phone, length: { minimum: 9, maximum: 12}, allow_blank: false, numericality: { only_integer: true }
	validates :password, length: {minimum: 8, maximum: 12}, format: { with: /\A[^\s]+\z/, on: create }
end
