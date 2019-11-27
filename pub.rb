class Pub

attr_reader :name, :till

  def initialize(name, till)
    @name = name
    @till = till
    @drinks = []
  end

  def total_drinks
    return @drinks.length
  end

  def add_drinks(drink)
    return @drinks << drink
  end

end
