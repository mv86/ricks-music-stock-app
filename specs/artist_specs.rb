require 'minitest/autorun'
require 'minitest/rg'
require_relative '../models/artist'

class ArtistTest < MiniTest::Test

  def setup
    @artist1 = Artist.new('name' => 'Jay Z', 'type' => 'Solo Artist')
  end

  def test_artists_name
    assert_equal('Jay Z', @artist1.name)
  end

  def test_artists_type
    assert_equal('Solo Artist', @artist1.type)
  end


end