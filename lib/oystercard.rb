class Oystercard

  attr_reader :bal

  START_BAL = 0
  MAX_BAL = 90
  MIN_FARE = 1
  TOP_UP_ERROR = "Limit exceeded, maximum balance is £#{MAX_BAL}"
  MIN_FARE_ERROR = "Balance insufficient, minimum fare is £#{MIN_FARE} "

  def initialize
    @bal = START_BAL
    @in_use = false
  end

  def top_up(amount)
    (bal + amount > MAX_BAL) ? (raise TOP_UP_ERROR) : (@bal += amount)
  end

  def touch_in
    raise MIN_FARE_ERROR if @bal < MIN_FARE
    @in_use = true
  end

  def touch_out
    @in_use = false
    deduct(MIN_FARE)
  end

  def in_jrny?
    @in_use
  end

  private

  def deduct(amount)
    @bal -= amount
  end

end
