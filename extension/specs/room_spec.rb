require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')

class RoomTest < MiniTest::Test

  def setup

    @song_1 = Song.new("Movin' On Up")
    @song_2 = Song.new("Song 2")
    @song_3 = Song.new("My Way")

    @songs = [@song_1, @song_2]

    @guest_1 = Guest.new("Frank")
    @guest_2 = Guest.new("Jodie")
    @guest_3 = Guest.new("Paul")
    @guest_4 = Guest.new("Julianne")

    @guests = [@guest_1, @guest_2, @guest_3]

    @room_1 = Room.new("Sinatra", 4)


  end

  def test_get_room_name
    assert_equal("Sinatra", @room_1.name)
  end

  def test_get_capacity
    assert_equal(4, @room_1.capacity)
  end

  # def test_get_songs
  #   assert_equal(@songs,   @room_1.get_songs)
  # end
  #
  # def test_get_guests
  #   assert_equal(@guests,   @room_1.get_guests)
  # end

  def test_check_if_at_capacity__false
    refute(@at_capacity)
  end



end
