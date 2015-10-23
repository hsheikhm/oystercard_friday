class Oystercard
  attr_reader :bal

  START_BAL = 0
  MAX_BAL = 90
  TOP_UP_ERROR = "Limit exceeded, maximum balance is £#{MAX_BAL}"

  def initialize
    @bal = START_BAL
    @in_use = false
  end

  def top_up(amount)
    (bal + amount > MAX_BAL) ? (raise TOP_UP_ERROR) : (@bal += amount)
  end

  def touch_in
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

  def in_jrny?
    @in_use
  end

  def deduct(amount)
    @bal -= amount
  end

end
