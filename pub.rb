class Pub

attr_reader :name, :till, :stock

  def initialize(name, till, stock = 0)
    @name = name
    @till = till
    @drinks = []
    @stock = stock
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

  def drink_count(all_drinks)
    for drink in all_drinks
      @stock += 1
    end
    return @stock
  end






end
