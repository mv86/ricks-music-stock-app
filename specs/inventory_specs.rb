require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/inventory'
require_relative '../models/stock'

class TestInventory < MiniTest::Test

  def setup
    @stock1 = Stock.new( {'quantity' => 2, 'buy_price' => 4.20, 'sell_price' => 10.50} )
  end

  def test_stock_level_accessor
    stock_level =  Inventory.stock_level_accessor(@stock1)
    assert_equal('Very Low', stock_level)
  end

end