require './spec/spec_helper'

describe Item do
	let(:item1) {Item.new('Chalkware Piggy Bank')}
	let(:item2) {Item.new('Bamboo Picture Frame')}

	describe '#initialize' do
		it 'exists' do
			expect(item1).to be_a(Item)
		end
		
		it 'has attributes' do
			expect(item1.name).to eq('Chalkware Piggy Bank')
		end
	end

	describe '#add_bid' do
		it 'can add a bid to item' do
			attendee1 = double("Attendee 1")
			attendee2 = double("Attendee 2")

			item1.add_bid(attendee2, 20)
			item1.add_bid(attendee1, 22)

			expected = {
				attendee2 => 20,
				attendee1 => 22
			}
			expect(item1.bids).to eq(expected)
		end
	end

	describe '#current_high_bid' do
		it 'returns the highest current bid for item' do
			attendee1 = double("Attendee 1")
			attendee2 = double("Attendee 2")

			item1.add_bid(attendee2, 20)
			item1.add_bid(attendee1, 22)

			expect(item1.current_high_bid).to eq(22)
		end
	end
end