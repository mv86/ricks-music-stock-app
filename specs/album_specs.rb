require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/album'

class TestAlbums < MiniTest::Test

  def setup
    @album1 = Album.new('title' => 'The Black Album', 'year' => 2003)
  end

  def test_album_title
    assert_equal('The Black Album', @album1.title)
  end

  def test_album_year
    assert_equal(2003, @album1.year)
  end
end