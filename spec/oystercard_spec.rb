require 'oystercard'

describe Oystercard do

  subject(:card) { described_class.new }
  let(:max_bal) { described_class::MAX_BAL }
  let(:min_fare) { described_class::MIN_FARE }
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

  context '#touch_in' do
    it 'makes #in_jrny? return true' do
      card.top_up(10)
      card.touch_in(:stn)
      expect(card).to be_in_jrny
    end

    it 'raises error if #@bal is lower than #MIN_FARE' do
      expect{card.touch_in(:stn)}.to raise_error min_fare_error
    end

    it 'stores the entry station' do
      card.top_up(10)
      card.touch_in(:stn)
      expect(card.entry_stn).to eq :stn
    end

  end

  context '#touch_out' do
    before { card.top_up(min_fare); card.touch_in(:entry_stn); }
    it 'makes @in_jrny? return false' do
      card.touch_out(:exit_stn)
      expect(card).not_to be_in_jrny
    end

    it 'deducts the minimum fare from #@bal' do
      expect{card.touch_out(:exit_stn)}.to change{card.bal}.by(-min_fare)
    end

    it 'stores a trip' do
      trip = { :entry_stn => :exit_stn }
      card.touch_out(:exit_stn)
      expect(card.trips).to include(trip)
    end
  end

end
