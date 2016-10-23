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
end