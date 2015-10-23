require 'oystercard'

describe Oystercard do
  subject(:card) { described_class.new }

  context '#initialize' do
    it 'sets a default balance' do
      expect(card.bal).to eq described_class::START_BAL
    end
  end
end
