require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub')
require_relative('../drinks')
require_relative('../customers')


class PubTest < Minitest::Test

  def setup

    @pub = Pub.new("Black Bull", 1000.00)

    @drink1 = Drink.new("Guiness", 4.0)
    @drink2 = Drink.new("Lager", 3.5)
    @drink3 = Drink.new("Juice", 2.5)
    @drink4 = Drink.new("Wine", 3.0)

    @pub_drinks = [@drink1, @drink2, @drink3, @drink4]

    @customer = Customer.new("Robert", 100.00)

  end

  def test_pub_has_name
    assert_equal("Black Bull", @pub.name)
  end

  def test_till_starting_amount
    assert_equal(1000.00, @pub.till)
  end

  def test_get_total_drinks_from_pub_from_initial_state
    assert_equal(0, @pub.total_drinks)
  end

  def test_pub_has_drinks_when_stock_is_added
    @pub.add_drinks(@drink1)
    @pub.add_drinks(@drink2)
    @pub.add_drinks(@drink3)
    @pub.add_drinks(@drink4)
    assert_equal(@pub_drinks.length, @pub.total_drinks)
  end

  def test_till_increases_when_sale_completed
    @pub.sale_amount(4.50)
    assert_equal(1004.50, @pub.till)
  end

  def test_drink_removed_from_pub_when_sold
    @pub.add_drinks(@drink1)
    @pub.add_drinks(@drink2)
    @pub.add_drinks(@drink3)
    @pub.add_drinks(@drink4)
    @pub.remove_drink(@drink2)
    assert_equal(3, @pub.total_drinks)
  end

  def test_correct_drink_removed_by_name
    @pub.add_drinks(@drink1)
    @pub.add_drinks(@drink2)
    @pub.add_drinks(@drink3)
    @pub.add_drinks(@drink4)
    name = @pub.remove_drink(@drink2).name
    assert_equal("Lager", name)
  end

  def test_customer_can_buy_drink
      assert_equal(true, @customer.sufficient_funds(@drink1.price))
      @customer.remove_cash(@drink1.price)
      @pub.sale_amount(@drink1.price)
      @pub.remove_drink(@drink1)
      @customer.add_drink_to_customer(@drink1)
      assert_equal(1, @customer.personal_drinks_total)
  end





end
