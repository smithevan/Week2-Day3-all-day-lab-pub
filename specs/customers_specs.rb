require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../customers')
require_relative('../drinks')


class CustomerTest < Minitest::Test

  def setup

    @customer = Customer.new("Bob", 50)

  end

  def test_customer_has_a_name
    assert_equal("Bob", @customer.name)
  end

  def test_customer_has_wallet
    assert_equal(50, @customer.wallet)
  end


end
