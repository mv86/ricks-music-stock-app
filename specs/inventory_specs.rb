require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/inventory'
require_relative '../models/stock'

class TestInventory < MiniTest::Test

  def setup
    @stock1 = Stock.new( {'quantity' => 2, 'buy_price' => 4.20, 'sell_price' => 10.50} )
    @stock2 = Stock.new( {'quantity' => 21, 'buy_price' => 4.20, 'sell_price' => 10.50} )
    @stock3 = Stock.new( {'quantity' => 8, 'buy_price' => 3.99, 'sell_price' => 6.50} )
  end

  def test_stock_level_accessor
    stock_level =  Inventory.stock_level_accessor(@stock1)
    assert_equal('Very Low', stock_level)
  end

  def test_stock_level_accessor_again
    stock_level =  Inventory.stock_level_accessor(@stock2)
    assert_equal('High', stock_level)
  end

  def test_product_markup
    product_markup = Inventory.product_markup(@stock1)
    assert_equal(6.30, product_markup)
  end

  def test_total_items_profit
    item_profit = Inventory.total_items_profit(@stock2)
    assert_equal(132.30, item_profit)
  end

  def test_total_stock_cost
    total_stock = [@stock1, @stock2] 
    assert_equal(96.60, Inventory.total_stock_cost(total_stock))
  end

  def test_total_available_profit
    total_profit = [@stock1, @stock2]
    assert_equal(144.90, Inventory.total_available_profit(total_profit))
  end

  def test_quantity_of_albums_in_stock
    all_albums = [@stock1, @stock2]
    assert_equal(23, Inventory.quantity_of_albums_in_stock(all_albums))
  end

  def test_very_low_stock
    all_stock = [@stock1, @stock2]
    assert_equal([@stock1], Inventory.very_low_stock(all_stock))
  end

  def test_low_stock
    all_stock = [@stock1, @stock2, @stock3]
    assert_equal([@stock3], Inventory.low_stock(all_stock))
  end

  # def test_sort_by_quantity
  #   all_stock = [@stock1, @stock2]
  #   assert_equal([[@stock1], [@stock2]], Inventory.sort_by_quantity(all_stock))
  # end

end