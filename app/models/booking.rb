class Booking < ApplicationRecord

	belongs_to :instructor
	validates_presence_of :name, :dob, :date_lesson

	def membership_label
		self.as_member == 1 ? "Member" : "Non-Member"
	end
end
