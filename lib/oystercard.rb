class Oystercard

  attr_reader :bal, :entry_stn, :trips

  START_BAL = 0
  MAX_BAL = 90
  MIN_FARE = 1
  TOP_UP_ERROR = "Limit exceeded, maximum balance is £#{MAX_BAL}"
  MIN_FARE_ERROR = "Balance insufficient, minimum fare is £#{MIN_FARE} "

  def initialize
    @bal = START_BAL
    @in_use = false
    @trips = []
  end

  def top_up(amount)
    (bal + amount > MAX_BAL) ? (raise TOP_UP_ERROR) : (@bal += amount)
  end

  def touch_in(stn)
    raise MIN_FARE_ERROR if @bal < MIN_FARE
    @in_use = true
    @entry_stn = stn
  end

  def touch_out(exit_stn)
    @in_use = false
    deduct(MIN_FARE)
    @trips << { @entry_stn => exit_stn }
  end

  def in_jrny?
    @in_use
  end

  private

  def deduct(amount)
    @bal -= amount
  end

end
