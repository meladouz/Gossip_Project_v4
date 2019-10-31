class Gossip < ApplicationRecord
	belongs_to :user
	has_many :comments
	has_many :likes
	validates :title, presence: true#, length: {in: 3..14}
	validates :gossip, presence: true

	def self.show_all
		all_gossips = Gossip.all
	#	return all_gossips
	end
end
