class Category < ApplicationRecord

	has_many :horses

	validates_presence_of :name
	validates_uniqueness_of :name

	def title_and_count
		"#{self.name} (#{self.horses.count})"
	end

end
