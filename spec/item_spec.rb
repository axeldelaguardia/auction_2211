require './spec/spec_helper'

describe Item do
	let(:item1) {Item.new('Chalkware Piggy Bank')}
	let(:item2) {Item.new('Bamboo Picture Frame')}

	describe '#initialize' do
		it 'exists' do
			expect(item1).to be_a(Item)
		end
		
		it 'has attributes' do
			expect(item.name).to eq('Chalkware Piggy Bank')
		end
	end
end