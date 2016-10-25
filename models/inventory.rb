

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

  def self.total_items_profit(stock_items)
    markup = Inventory.product_markup(stock_items)
    profit = markup * stock_items.quantity
    item_profit = profit.round(2)
    return item_profit
  end

end