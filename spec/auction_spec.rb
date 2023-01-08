require './spec/spec_helper'

describe Auction do
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