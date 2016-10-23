require 'pg'
require_relative '../db/sql_runner'

class Artist

  attr_reader :id, :name, :type

  def initialize(params)
    @id = params['id'].to_i
    @name = params['name']
    @type = params['type']
  end
end