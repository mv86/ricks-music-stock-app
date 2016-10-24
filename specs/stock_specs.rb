require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/stock'

class TestStock < MiniTest::Test

  def setup
    @stock_item1 = Stock.new( {'quantity' => 2, 'buy_price' => 4.20, 'sell_price' => 10.20} )
  end

  def test_quantity
    assert_equal(2, @stock_item1.quantity)
  end

  def test_buy_price
    assert_equal(4.20, @stock_item1.buy_price)
  end

  def test_sell_price
    assert_equal(10.20, @stock_item1.sell_price)
  end
end