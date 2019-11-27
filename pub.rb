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

  def sale_amount(price_of_drink)
    @till += price_of_drink
  end

  def remove_drink(drink)
    return @drinks.delete(drink)
  end

  





end
