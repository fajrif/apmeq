class Facility < ApplicationRecord

	has_one_attached :image

	validates :image, attached: true
	validates_presence_of :name, :category_name
	validates_uniqueness_of :name

end
