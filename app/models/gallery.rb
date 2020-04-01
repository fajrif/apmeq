class Gallery < ApplicationRecord

	has_one_attached :image

	validates :image, attached: true

end
