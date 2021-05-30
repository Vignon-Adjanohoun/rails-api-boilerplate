class Point
  attr_reader :lat, :long

  # lat -> latitude, long-> longitude
  def initialize(lat, long)
    @lat = lat
    @long = long
  end

  # Converts an object of this instance into a database friendly value.
  def mongoize
    { type: 'Point', coordinates: [long, lat] }
  end

  class << self
    # Get the object as it was stored in the database, and instantiate
    # this custom class from it.
    def demongoize(object)
      Point.new(object[:coordinates][1], object[:coordinates][0])
    end

    # Takes any possible object and converts it to how it would be
    # stored in the database.
    def mongoize(object)
      case object
      when Point then object.mongoize
      when Hash then Point.new(object[:lat], object[:long]).mongoize
      when Array then Point.new(object[0], object[1]).mongoize
      else object
      end
    end

    # Converts the object that was supplied to a criteria and converts it
    # into a database friendly form.
    def evolve(object)
      case object
      when Point then object.mongoize
      else object
      end
    end
  end
end
