class Event < ApplicationRecord
	belongs_to :place
	has_many :tickets
	validate :start_date_before_creation_date, on: :create
	validate :check_place_avalability, on: :create
	
	def start_date_before_creation_date
		if self.start_date < Date.today
			errors.add(:start_date, "can't happen before creation date")
		end
	end
		
	def check_place_avalability
		if Event.exists?(place: self.place, start_date: self.start_date)
			errors.add(:place, "event ongoing on that date")		
		end
	end
	
end
