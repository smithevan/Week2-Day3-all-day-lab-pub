class Customer

attr_reader :name, :wallet, :age, :drunk

  def initialize(name, wallet, age, drunk)
    @name = name
    @wallet = wallet
    @drinks = []
    @age = age
    @drunk = drunk
  end

  def personal_drinks_total
    @drinks.length
  end

  def sufficient_funds(drink)
    return true if @wallet > drink
    return false
  end

  def remove_cash(cash)
    @wallet -= cash
  end

  def add_drink_to_customer(drink)
    return @drinks << drink
  end

  def age_check
    return true if @age >= 18
    return false
  end

  def alcohol_increase(drink)
    @drunk += drink
  end

  def alcohol_limit
    return true if @drunk >= 10
    return false
  end

  def alcohol_decrease(food)
    @drunk -= food 
  end


end
