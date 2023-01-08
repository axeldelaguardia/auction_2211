class Auction
	attr_reader :items

	def initialize
		@items = []
	end

	def add_item(item)
		items << item
	end

	def item_names
		item_names = items.group_by {|item| item.name}
		item_names.keys
	end

	def unpopular_items
		items.find_all do |item|
			item.bids.empty?
		end
	end

	def possible_revenue
		items_bidded.sum do |item|
			item.bids.values.max
		end
	end

	def items_bidded
		items.find_all do |item|
			!item.bids.empty?
		end
	end

	def bidders
		attendees = []
		items_bidded.each do |item|
			item.bids.keys.each do |bidder|
				attendees << bidder if !attendees.include?(bidder)
			end
		end
		attendees
	end
end