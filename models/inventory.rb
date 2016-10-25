

class Inventory

  def self.stock_level_accessor(stock)
    case stock.quantity
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

end