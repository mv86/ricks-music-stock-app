require 'pg'
require_relative '../db/sql_runner'

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
    VALUES #{@quantity}, #{@buy_price}, #{@sell_price},
    #{@artist_id}, #{@album_id} RETURNING *"
    stock = SqlRunner.run(sql).first
    @id = stock['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM stock"
    stock = Stock.new(sql)
    all_stock = stock.map { |stock_item| Stock.new(stock) }
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
end