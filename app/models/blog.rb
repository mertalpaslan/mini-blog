class Blog < ApplicationRecord
	belongs_to :user
	validates :name, presence: true
	validates_length_of :name, minimum: 3
	validates :user, presence: true

	before_save :set_subdomain

	def set_subdomain
		self.subdomain = I18n.transliterate(self.name.downcase.split(" ").join("_"))
	end
end
