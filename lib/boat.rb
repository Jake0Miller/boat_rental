class Boat
  attr_reader :type, :price_per_hour, :hours_rented, :currently_rented

  def initialize(type, price_per_hour)
    @type = type
    @price_per_hour = price_per_hour
    @hours_rented = 0
    @currently_rented = false
  end

  def add_hour
    @hours_rented += 1
  end

  def rent
    @currently_rented = true
  end

  def return
    @currently_rented = false
  end
end
