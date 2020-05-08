class Service < ApplicationRecord

	has_one_attached :image

	validates :image, attached: true
	validates_presence_of :name, :description
	validates_uniqueness_of :name

end
