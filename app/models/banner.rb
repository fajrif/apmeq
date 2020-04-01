class Banner < ApplicationRecord

	has_one_attached :image

	validates :image, attached: true
	validates_presence_of :caption1

	def caption_text
		"#{self.caption1} #{self.caption2} #{self.caption3}"
	end
end
