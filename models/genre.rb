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

  def self.all
    sql = "SELECT * FROM genres"
    all_genres = SqlRunner.run(sql)
    result = all_genres.map { |genre| Genre.new(genre) }
    return result
  end

end