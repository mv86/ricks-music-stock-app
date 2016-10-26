require_relative 'stock'

class Inventory

  def self.stock_level_accessor(stock_item)
    @very_low_stock = []
    @low_stock = []
    case stock_item.quantity
    when 1..5
      @very_low_stock.push(stock_item)
      return 'Very Low'
    when 6..10
      @low_stock.push(stock_item)
      return 'Low'
    when 11..20
      return 'Good'
    when 21..99
      return 'High'
    end
  end

  def self.product_markup(stock_item)
    markup = stock_item.sell_price - stock_item.buy_price
    return markup
  end

  def self.total_items_profit(stock_item)
    markup = Inventory.product_markup(stock_item)
    item_profit = markup * stock_item.quantity
    return item_profit.round(2)
  end

  def self.total_stock_cost(all_stock)
    total_stock_cost = 0
    all_stock.each do |each_stock_item|
      total_stock_cost += (each_stock_item.buy_price * each_stock_item.quantity)
    end
    return total_stock_cost.round(2)
  end

  def self.total_available_profit(all_stock)
    total_stock_markup = 0
    all_stock.each do |each_stock_item|
      stock_markup = (each_stock_item.sell_price - each_stock_item.buy_price)
      stock_item_profit_available = (each_stock_item.quantity * stock_markup)
      total_stock_markup += stock_item_profit_available
    end
    return total_stock_markup.round(2)
  end

  def self.quantity_of_albums_in_stock(all_stock)
    quantity_of_albums = 0
    all_stock.each do |each_stock_item|
      quantity_of_albums += each_stock_item.quantity
    end
    return quantity_of_albums
  end

  def self.very_low_stock(all_stock)
    very_low_stock = []
    all_stock.each do |item|
      if item.quantity <= 5
        very_low_stock.push(item)
      end
    end
    return  very_low_stock
  end

  def self.low_stock(all_stock)
    low_stock = [] 
    all_stock.each do |item|
      if item.quantity > 5 && item.quantity <= 10
        low_stock.push(item)
      end
    end
    return low_stock
  end

end