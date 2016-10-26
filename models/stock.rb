require 'pg'
require 'pry-byebug'
require_relative '../db/sql_runner'
require_relative('../models/inventory')

class Stock

  attr_reader :id, :quantity, :buy_price, :sell_price, :artist_id, :album_id

  def initialize(params)
    @id = params['id'].to_i
    @quantity = params['quantity'].to_i
    @buy_price = params['buy_price'].to_f
    @sell_price = params['sell_price'].to_f
    @artist_id = params['artist_id'].to_i
    @album_id = params['album_id'].to_i
  end

  def save
    sql = "INSERT INTO stock 
    (quantity, buy_price, sell_price, artist_id, album_id)
    VALUES (#{@quantity}, #{@buy_price}, #{@sell_price},
    #{@artist_id}, #{@album_id}) RETURNING *"
    stock = SqlRunner.run(sql).first
    @id = stock['id'].to_i
  end

  def artist
    sql = "SELECT * FROM artists
    WHERE id = #{@artist_id}"
    artist = SqlRunner.run(sql).first
    artist_info = Artist.new(artist)
    return artist_info
  end

  def album
    sql = "SELECT * FROM albums
    WHERE id = #{@album_id}"
    album = SqlRunner.run(sql).first
    album_info = Album.new(album)
    return album_info
  end

  def stock_sql_retriever
    sql = "SELECT * FROM stock WHERE id = #{@id}"
    item = SqlRunner.run(sql).first
    stock_item = Stock.new(item)
    return stock_item
  end

  def stock_level
    stock_item = stock_sql_retriever
    stock_level = Inventory.stock_level_accessor(stock_item)
    return stock_level
  end
  
  def markup
    stock_item = stock_sql_retriever
    stock_markup = Inventory.product_markup(stock_item)
    return stock_markup
  end 

  def total_item_profit
    stock_item = stock_sql_retriever
    available_item_profit = Inventory.total_items_profit(stock_item)
    return available_item_profit
  end

  def self.total_cost_of_current_stock
    all_stock = Stock.all
    cost_of_all_stock = Inventory.total_stock_cost(all_stock)
    return cost_of_all_stock
  end

  def self.total_available_profit
    all_stock = Stock.all
    total_available_profit = Inventory.total_available_profit(all_stock)
    return total_available_profit
  end

  def self.quantity_of_albums_in_stock
    all_stock = Stock.all
    quantity_of_albums_in_stock = Inventory.quantity_of_albums_in_stock(all_stock)
    return quantity_of_albums_in_stock
  end

  def self.very_low_stock_items
    all_stock = Stock.all
    very_low_stock_items = Inventory.very_low_stock(all_stock)
    return very_low_stock_items
  end

  def self.low_stock_items
    all_stock = Stock.all
    low_stock_items = Inventory.low_stock(all_stock)
    return low_stock_items
  end

  def self.all
    sql = "SELECT * FROM stock"
    stock = SqlRunner.run(sql)
    all_stock = stock.map { |stock_item| Stock.new(stock_item) }
    return all_stock
  end

  def self.find(id)
    sql = "SELECT * FROM stock WHERE id = #{id}"
    item = SqlRunner.run(sql).first
    stock_item = Stock.new(item)
    return stock_item
  end

  def self.update(params)
    sql = "UPDATE stock SET 
    quantity = #{params['quantity']},
    buy_price = #{params['buy_price']},
    sell_price = #{params['sell_price']},
    artist_id = #{params['artist_id']},
    album_id = #{params['album_id']}
    WHERE id = #{params['id']}"
    SqlRunner.run(sql) 
  end

  def self.delete(id)
    sql = "DELETE FROM stock WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM stock"
    SqlRunner.run(sql)
  end
end