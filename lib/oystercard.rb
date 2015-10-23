class Oystercard
  attr_reader :bal

  START_BAL = 0
  MAX_BAL = 90
  TOP_UP_ERROR = "Limit exceeded, maximum balance is £#{MAX_BAL}"

  def initialize
    @bal = START_BAL
  end

  def top_up(amount)
    (bal + amount > MAX_BAL) ? (raise TOP_UP_ERROR) : (@bal += amount)
  end

  def deduct(amount)
    @bal -= amount
  end

end
