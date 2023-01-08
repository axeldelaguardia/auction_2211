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
end