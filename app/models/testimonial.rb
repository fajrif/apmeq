class Testimonial < ApplicationRecord

	has_one_attached :image

	validates :image, attached: true
	validates_presence_of :name, :title, :comment

end
