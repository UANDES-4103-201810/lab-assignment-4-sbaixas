class Ticket < ApplicationRecord
	belongs_to :event
	has_many :user_tickets
	has_many :users, through: :user_tickets
	validates :price, numericality: {greater_than_or_equal_to: 0, only_integer: true}
	validate :check_created_after_event, on: :create
	
	def check_created_after_event
		if self.event.start_date < Date.today
			errors.add(:created_at, "event already started")		
		end	
	end

	
end
