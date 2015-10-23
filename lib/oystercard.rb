class Oystercard
  attr_reader :bal

  START_BAL = 0

  def initialize
    @bal = START_BAL
  end

  def top_up(amount)
    @bal += amount
  end

end
