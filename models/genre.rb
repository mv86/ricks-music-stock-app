require 'pg'
require_relative '../db/sql_runner'

class Genre

  attr_reader :id, :genre

  def initialize(params)
    @id = params['id'].to_i
    @genre = params['genre']
  end

end