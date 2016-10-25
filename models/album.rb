require 'pg'
require_relative '../db/sql_runner'
require_relative 'stock'

class Album

  attr_reader :id, :title, :year, :artist_id

  def initialize(params)
    @id = params['id'].to_i
    @title = params['title']
    @year = params['year'].to_i
    @artist_id = params['artist_id'].to_i
  end

  def save
    sql = "INSERT INTO albums (title, year, artist_id) 
    VALUES ('#{@title}', #{@year}, #{@artist_id}) RETURNING *"
    album = SqlRunner.run(sql).first
    @id = album['id'].to_i
  end

  def artist
    sql = "SELECT * FROM artists WHERE
    id = #{@artist_id}"
    artist = SqlRunner.run(sql).first
    albums_artist = Artist.new(artist)
    return albums_artist
  end

  def stock_orders
    sql = "SELECT * FROM stock WHERE
    @album_id = #{@id}"
    stock = SqlRunner.run(sql).first
    stock_orders = Stock.new(stock)
    return stock_orders
  end

  def self.all
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    all_albums = albums.map { |album| Album.new(album) }
    return all_albums
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = #{id}"
    album = SqlRunner.run(sql).first
    result = Album.new(album)
    return result
  end

  def self.update(params)
    sql = "UPDATE albums SET
    title = '#{params['title']}',
    year = #{params['year']},
    artist_id = #{params['artist_id']}
    WHERE id = #{params['id']}"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM albums WHERE id = #{id}"
    SqlRunner.run(sql)
  end

end