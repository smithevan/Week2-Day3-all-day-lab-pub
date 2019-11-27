require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customers')
require_relative('../drinks')


class CustomerTest < Minitest::Test

  def setup
    @customer = Customer.new("Bob", 50.00, 34, 0)

    @drink = Drink.new("Guiness", 4.00, 2)
  end

  def test_customer_has_a_name
    assert_equal("Bob", @customer.name)
  end

  def test_customer_has_wallet
    assert_equal(50, @customer.wallet)
  end

  def test_customer_personal_drinks_starts_at_zero
    assert_equal(0, @customer.personal_drinks_total)
  end

  def test_customer_has_sufficient_funds_for_drink
    assert_equal(true, @customer.sufficient_funds(@drink.price))
  end

  def test_customer_can_spend_money_wallet_decreases
    @customer.remove_cash(10.00)
    assert_equal(40.00, @customer.wallet)
  end

  def test_drink_to_customer
    assert_equal(1, @customer.add_drink_to_customer(@drink).length)
  end

  def test_customer_has_age
    assert_equal(34, @customer.age)
  end

  def test_check_customer_age
    assert_equal(true, @customer.age_check)
  end

  def test_customer_drunkeness_level_zero
    assert_equal(0, @customer.drunk)
  end

  def alcohol_increase
    @customer.alcohol_increase(@drink.alcohol_level)
    assert_equal(2, @customer.drunk)
  end

  def test_alcohol_limit__if_drunk
    @customer.alcohol_increase(@drink.alcohol_level)
    @customer.alcohol_increase(@drink.alcohol_level)
    @customer.alcohol_increase(@drink.alcohol_level)
    @customer.alcohol_increase(@drink.alcohol_level)
    @customer.alcohol_increase(@drink.alcohol_level)
    assert_equal(true, @customer.alcohol_limit)
  end

  def test_alcohol_limit__if_drunk
    @customer.alcohol_increase(@drink.alcohol_level)
    @customer.alcohol_increase(@drink.alcohol_level)
    assert_equal(false, @customer.alcohol_limit)
  end

end
