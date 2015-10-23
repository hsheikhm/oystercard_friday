require "station"

describe Station do

  subject(:station) { described_class.new(:name, :zone) }

  it 'stores the station name and zone' do
    expect(station).to have_attributes(:name => :name, :zone => :zone)
  end

end
