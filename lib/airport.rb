require_relative 'planes'
require_relative 'weather'

class Airport

  attr_reader :apron, :capacity, :weather

  def initialize(capacity = 1)
    @apron = []
    @capacity = capacity
    @weather = Weather.new
  end

  def land(plane)
    fail "A plane can't land, there's no room!" if apron.length == capacity

    fail "Plane cannot land during bad weather!" if weather.weather_report == "stormy"

    fail "This plane is already at this airport" if
    apron.include?(plane.name)

    fail "This plane is already at another airport" if
    plane.status == "landed"

    apron << plane.name
    plane.status = "landed"
    "#{plane.name} has landed!"
    # change_status(plane)
  end

  def take_off(plane)

    return fail "Plane is not at this airport" unless apron.include?(plane.name)

    apron.delete(plane.name)
    plane.status = "flying"
    "#{plane.name} has taken off!"
    # change_status(plane)
  end

  # def change_status(plane)
  #
  #   plane.status = "landed"
  #   "#{plane.name} has landed!"
  #
  #   plane.status = "flying"
  #   "#{plane.name} has taken off!"
  #
  # end

  def planes_at_airport
    apron
  end
end
