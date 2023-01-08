require './spec/spec_helper'

describe Auction do
	context 'iteration 1' do
		let(:item1) {Item.new('Chalkware Piggy Bank')}
		let(:item2) {Item.new('Bamboo Picture Frame')}
		let(:attendee) {Attendee.new(name: 'Megan', budget: '$50')}
		let(:auction) {Auction.new}

		describe '#initialize' do
			it 'exists' do
				expect(auction).to be_a(Auction)
			end

			it 'has attributes' do
				expect(auction.items).to eq([])
			end
		end

		describe '#add_item' do
			it 'can add item to collection' do
				auction.add_item(item1)
				auction.add_item(item2)

				expect(auction.items).to eq([item1, item2])
			end
		end

		describe '#item_names' do
			it 'can return a list of item names in collection' do
				auction.add_item(item1)
				auction.add_item(item2)

				expect(auction.item_names).to eq(["Chalkware Piggy Bank", "Bamboo Picture Frame"])
			end
		end
	end

	context 'iteration 2' do
		let(:item1) {Item.new('Chalkware Piggy Bank')}
		let(:item2) {Item.new('Bamboo Picture Frame')}
		let(:item3) {Item.new('Homemade Chocolate Chip Cookies')}
		let(:item4) {Item.new('2 Days Dogsitting')}
		let(:item5) {Item.new('Forever Stamps')}
		let(:attendee1) {Attendee.new(name: 'Megan', budget: '$50')}
		let(:attendee2) {Attendee.new(name: 'Bob', budget: '$75')}
		let(:attendee3) {Attendee.new(name: 'Mike', budget: '$100')}
		let(:auction) {Auction.new}

		before do
			auction.add_item(item1)
			auction.add_item(item2)
			auction.add_item(item3)
			auction.add_item(item4)
			auction.add_item(item5)

			item1.add_bid(attendee2, 20)
			item1.add_bid(attendee1, 22)
			item4.add_bid(attendee3, 50)
		end

		describe '#unpopular_items' do
			it 'returns an array with unpopular items' do
				expect(auction.unpopular_items).to eq([item2, item3, item5])

				item3.add_bid(attendee2, 15)

				expect(auction.unpopular_items).to eq([item2, item5])
			end
		end

		describe '#items_bidded' do
			it 'returns an array with unpopular items' do
				expect(auction.items_bidded).to eq([item1, item4])

				item3.add_bid(attendee2, 15)

				expect(auction.items_bidded).to eq([item1, item3, item4])
			end
		end

		describe '#potential_revenue' do
			it 'returns total possible sales price of the items highest bid' do
				item3.add_bid(attendee2, 15)

				expect(auction.possible_revenue).to eq(87)
			end
		end
	end
	
	context 'iteration 3' do
		let(:item1) {Item.new('Chalkware Piggy Bank')}
		let(:item2) {Item.new('Bamboo Picture Frame')}
		let(:item3) {Item.new('Homemade Chocolate Chip Cookies')}
		let(:item4) {Item.new('2 Days Dogsitting')}
		let(:item5) {Item.new('Forever Stamps')}
		let(:attendee1) {Attendee.new(name: 'Megan', budget: '$50')}
		let(:attendee2) {Attendee.new(name: 'Bob', budget: '$75')}
		let(:attendee3) {Attendee.new(name: 'Mike', budget: '$100')}
		let(:auction) {Auction.new}

		before do
			auction.add_item(item1)
			auction.add_item(item2)
			auction.add_item(item3)
			auction.add_item(item4)
			auction.add_item(item5)

			item1.add_bid(attendee2, 20)
			item1.add_bid(attendee1, 22)
			item3.add_bid(attendee2, 15)
		end

		describe '#bidders' do
			it 'returns an array with all attendees who have made a bid' do
				expect(auction.bidders).to eq([attendee2, attendee1])

				item4.add_bid(attendee3, 50)

				expect(auction.bidders).to eq([attendee2, attendee1, attendee3])
			end
		end

		describe '#bidder_info' do
			it 'returns a hash with keys as attendees and values are hashes with budgets and items bidded on' do
				item4.add_bid(attendee3, 50)

				expected = {
					attendee1 => {
						budget: 50,
						items: [item1]
					},
					attendee2 => {
						budget: 75,
						items: [item1, item3]
					},
					attendee3 => {
						budget: 100,
						items: [item4]
					}
				}

				expect(auction.bidder_info).to eq(expected)
			end
		end
	end
end