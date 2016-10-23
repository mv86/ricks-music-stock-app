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
end