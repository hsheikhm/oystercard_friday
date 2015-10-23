require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new }
  let(:max_bal) { described_class::MAX_BAL}
  let(:top_up_error) { described_class::TOP_UP_ERROR }
  let(:min_fare_error) { described_class::MIN_FARE_ERROR }

  context '#initialize' do
    it 'sets a default balance' do
      expect(card.bal).to eq described_class::START_BAL
    end
  end

  context '#top_up' do
    it 'increases #@bal' do
      expect{card.top_up(1)}.to change{card.bal}.by(1)
    end

    it 'raises error if #top_up more than #MAX_BAL' do
      expect{card.top_up(max_bal + 1)}.to raise_error top_up_error
    end
  end

  context '#deduct' do
    it 'reduces #@bal' do
      expect{card.deduct(1)}.to change{card.bal}.by(-1)
    end
  end

  context '#touch_in' do
    it 'makes #in_jrny? return true' do
      card.top_up(10)
      card.touch_in
      expect(card).to be_in_jrny
    end

    it 'raises error if #@bal is lower than #MIN_FARE' do
      expect{card.touch_in}.to raise_error min_fare_error
    end

  end

  context '#touch_out' do
    it 'makes @in_jrny? return false' do
      card.top_up(10)
      card.touch_in
      card.touch_out
      expect(card).not_to be_in_jrny
    end
  end

end
