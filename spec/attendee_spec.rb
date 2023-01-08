require './spec/spec_helper'

describe Attendee do
	let(:item1) {Item.new('Chalkware Piggy Bank')}
	let(:item2) {Item.new('Bamboo Picture Frame')}
	let(:attendee) {Attendee.new(name: 'Megan', budget: '$50')}

	describe '#initialize' do
		it 'exists' do
			expect(attendee).to be_a(Attendee)
		end

		it 'has attributes' do
			expect(attendee.name).to eq('Megan')
			expect(attendee.budget).to eq('$50')
		end
	end
end