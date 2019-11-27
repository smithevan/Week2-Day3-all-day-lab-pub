require('minitest/autorun')
require('minitest/reporters')

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../pub')
require_relative('../drinks')
require_relative('../customers')


class PubTest < Minitest::Test

  def setup

    @pub = Pub.new("Black Bull", 1000)

  end

  def test_pub_has_name
    assert_equal("Black Bull", @pub.name)
  end

  def test_till_starting_amount
    assert_equal(1000, @pub.till)
  end


end
