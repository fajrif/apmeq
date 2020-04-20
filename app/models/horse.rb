class Horse < ApplicationRecord
	extend FriendlyId

  friendly_id :name, use: :slugged

	has_many_attached :images
	belongs_to :category

	validates_presence_of :name, :description, :sex, :color
	validates_uniqueness_of :name

	def image
		self.images.first unless images.empty?
	end
end
