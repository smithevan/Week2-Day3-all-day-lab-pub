class Customer

attr_reader :name, :wallet

  def initialize(name, wallet)
    @name = name
    @wallet = wallet
    @drinks = []
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

end
