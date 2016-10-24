require 'pg'
require_relative '../db/sql_runner'

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

  def self.all
    sql = "SELECT * FROM albums"
    albums = SqlRunner.run(sql)
    all_albums = albums.map { |album| Album.new(album)}
    return all_albums
  end

  def self.find(id)
    sql = "SELECT * FROM albums WHERE id = #{id}"
    album = SqlRunner.run(sql).first
    result = Album.new(album)
    return result
  end

end