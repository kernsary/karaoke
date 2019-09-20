require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')

class SongTest < MiniTest::Test

  def setup

    @song_1 = Song.new("My Way")

  end

  def test_song_name
    assert_equal("My Way", @song_1.name)
  end

end
