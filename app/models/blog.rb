class Blog < ApplicationRecord
	belongs_to :user
	validates :name, presence: true
	validates_length_of :name, minimum: 3
	validates :user, presence: true

end
