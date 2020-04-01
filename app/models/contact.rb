class Contact < ApplicationRecord

	default_scope { order(created_at: :desc) }

	validates_presence_of :name, :email, :phone, :message
end
