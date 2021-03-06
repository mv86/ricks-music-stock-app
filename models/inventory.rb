require_relative 'stock'

class Inventory

  def self.stock_level_accessor(stock_item)
    case stock_item.quantity
    when 1..5
      return 'Very Low'
    when 6..10
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

  def self.motivation_generator
    quotes = [
      '"Failure is the opportunity to begin again more intelligently" - Henry Ford',
      '“Whenever you find yourself on the side of the majority, it is time to pause and reflect.” - Mark Twain',
      '“I have not failed. I’ve just found 10,000 ways that won’t work.” - Thomas A. Edison',
      '"Wash the dishes to wash the dishes, dont wash the dishes to clean the plates" - Thich Nhat Hanh',
      '“The successful warrior is the average man, with laser-like focus.” - Bruce Lee']
      return quotes.sample
  end

end