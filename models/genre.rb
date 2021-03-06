require 'pg'
require_relative '../db/sql_runner'

class Genre

  attr_reader :id, :genre

  def initialize(params)
    @id = params['id'].to_i
    @genre = params['genre']
  end

  def save
    sql = "INSERT INTO genres (genre)
    VALUES ('#{@genre}') RETURNING *"
    new_genre = SqlRunner.run(sql).first
    @id = new_genre['id'].to_i
  end

  def self.albums(id)
    sql = "SELECT * FROM albums INNER JOIN 
    genres on albums.genre = genres.genre 
    WHERE genres.id = #{id}"
    albums = SqlRunner.run(sql)
    albums_of_this_genre = albums.map { |album| Album.new(album) }
    return albums_of_this_genre
  end

  def self.artists(id)
    sql = "SELECT * FROM artists INNER JOIN genres on artists.genre = genres.genre WHERE genres.id = #{id}"
    artists = SqlRunner.run(sql)
    artists_of_this_genre = artists.map { |artist| Artist.new(artist) }
    return artists_of_this_genre
  end

  def self.all
    sql = "SELECT * FROM genres ORDER BY genre ASC"
    all_genres = SqlRunner.run(sql)
    result = all_genres.map { |genre| Genre.new(genre) }
    return result
  end

  def self.find(id)
    sql = "SELECT * FROM genres WHERE id = #{id}"
    genre = SqlRunner.run(sql).first
    result = Genre.new(genre)
    return result
  end

  def self.update(params)
    sql = "UPDATE genres SET
    genre = '#{params['genre']}'
    WHERE id = #{params['id']}"
    SqlRunner.run(sql).first
  end

  def self.delete(id)
    sql = "DELETE FROM genres WHERE id = #{id}"
    SqlRunner.run(sql)
  end

  def self.delete_all
    sql = "DELETE FROM genres"
    SqlRunner.run(sql)
  end

end