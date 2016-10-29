require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/genre'

class TestGenre < MiniTest::Test

  def setup
    @genre1 = Genre.new('genre' => 'Rock')
  end

  def test_genre_genre
    assert_equal('Rock', @genre1.genre)
  end

end