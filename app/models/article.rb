class Article < ApplicationRecord
	extend FriendlyId

  friendly_id :title, use: :slugged

	default_scope { order(created_at: :desc) }

	has_one_attached :image

	validates :image, attached: true
	validates_presence_of :title, :description
	validates_uniqueness_of :title

end
