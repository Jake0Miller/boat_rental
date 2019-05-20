class Dock
  attr_reader :name, :max_rental_time, :rental_log

  def initialize(name, max_rental_time)
    @name = name
    @max_rental_time = max_rental_time
    @rental_log = {}
    @revenue = 0
  end

  def rent(boat, renter)
    @rental_log[boat] = renter
    boat.rent
  end

  def charge(boat)
    {:card_number => @rental_log[boat].credit_card_number,
    :amount => boat.price_per_hour * [max_rental_time, boat.hours_rented].min}
  end

  def return(boat)
    boat.return
  end

  def log_hour
    @rental_log.keys.each { |boat| boat.add_hour }
  end

  def revenue
    @revenue += add_revenue
  end

  def add_revenue
    returned_boats = @rental_log.keys.find_all { |boat| !boat.currently_rented }
    returned_boats.each { |boat| @rental_log.delete(boat) }
    returned_boats.sum { |boat| [boat.hours_rented,max_rental_time].min * boat.price_per_hour }
  end
end
