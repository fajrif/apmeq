class Instructor < ApplicationRecord

	has_one_attached :image

	validates :image, attached: true
	validates_presence_of :name, :title, :profile
	validates_uniqueness_of :name

end
