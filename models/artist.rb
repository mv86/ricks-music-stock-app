require 'pg'
require_relative '../db/sql_runner'

class Artist

  attr_reader :id, :name, :type

  def initialize(params)
    @id = params['id'].to_i
    @name = params['name']
    @type = params['type']
  end

  def save
    sql = "INSERT INTO artists 
    (name, type) VALUES 
    ('#{@name}', '#{@type}')
    RETURNING *"
    artist = SqlRunner.run(sql).first
    @id = artist['id'].to_i
  end

  def albums
    sql = "SELECT * FROM albums WHERE
    artist_id = #{@id}"
    albums = SqlRunner.run(sql)
    artists_albums = albums.map { |album| Album.new(album)} 
    return artists_albums
  end

  def self.all
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    all_artists = artists.map { |artist| Artist.new(artist) }
    return all_artists
  end

  def self.find(id)
    sql = "SELECT * FROM artists WHERE id = #{id}"
    artist = SqlRunner.run(sql).first
    result = Artist.new(artist)
    return result 
  end

  def self.update(params)
    sql = "UPDATE artists SET 
    name = '#{params['name']}', 
    type = '#{params['type']}'
    WHERE id = #{params['id']}"
    SqlRunner.run(sql)
  end

  def self.delete(id)
    sql = "DELETE FROM artists WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM artists"
    SqlRunner.run(sql)
  end

end