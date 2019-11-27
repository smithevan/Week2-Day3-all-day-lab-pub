require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drinks')

class DrinksTest < Minitest::Test

  def setup
    @drink = Drink.new("Guiness", 4.0, 2)
  end

  def test_drink_has_name
    assert_equal("Guiness", @drink.name)
  end

  def test_drink_has_price
    assert_equal(4.0, @drink.price)
  end

end
