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
				attendee1 => 20,
				attendee2 => 22
			}
			expect(item1.bids).to eq(expected)
		end
	end
end