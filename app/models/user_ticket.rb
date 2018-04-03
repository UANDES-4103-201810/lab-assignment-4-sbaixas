class UserTicket < ApplicationRecord
	belongs_to :user
	belongs_to :ticket
	validate :check_bought_after_event, on: :create
	validate :has_unpaid_ticket, on: :create
	
	def check_bought_after_event:
		if self.ticket.event.start_date < Date.today
			errors.add(:created_at, "event already started")		
		end	
	end

	def check_bought_after_event:
		if UserTicket.exists?(user_id: self.user, paid: false)
			errors.add(:user_id, "user has unpayed tickets")
		end
	end
end
