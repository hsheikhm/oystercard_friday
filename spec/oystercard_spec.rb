require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new }
  let(:max_bal) { described_class::MAX_BAL}
  let(:top_up_error) { described_class::TOP_UP_ERROR }

  context '#initialize' do
    it 'sets a default balance' do
      expect(card.bal).to eq described_class::START_BAL
    end
  end

  context '#top_up' do
    it 'increases #@bal' do
      expect{card.top_up(1)}.to change{card.bal}.by(1)
    end

    it 'raises error if #top_up more than max bal' do
      expect{card.top_up(max_bal + 1)}.to raise_error top_up_error
    end
  end

  context '#deduct' do
    it 'reduces #@bal' do
      expect{card.deduct(1)}.to change{card.bal}.by(-1)
    end

  end

end
