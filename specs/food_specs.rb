require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../food.rb')


class FoodTest < Minitest::Test

  def setup
    @food = Food.new("Fish and Chips", 8.00, 3)
  end

  def test_food_has_name
    assert_equal("Fish and Chips", @food.name)
  end

  def test_food_has_price
    assert_equal(8.00, @food.price)
  end

  def test_food_has_rejuvination
    assert_equal(3, @food.rejuvination)
  end


end
