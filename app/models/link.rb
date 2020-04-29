class Link < ApplicationRecord

	validates_presence_of :name, :caption, :url
	validates_uniqueness_of :name

end
