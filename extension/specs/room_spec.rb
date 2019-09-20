require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')

class RoomTest < MiniTest::Test

  def setup


    @song_1 = "Movin' On Up"
    @song_2 = "Song 2"
    @song_3 = "My Way"

    @songs = [@song_1, @song_2]

    @guest_1 = Guest.new("Frank")
    @guest_2 = Guest.new("Jodie")
    @guest_3 = Guest.new("Paul")
    @guest_4 = Guest.new("Julianne")

    @guests = [@guest_1, @guest_2, @guest_3]

    @room_1 = Room.new("Sinatra", @songs, @guests)


  end

  def test_get_room_name
    assert_equal("Sinatra", @room_1.name)
  end

  def test_get_songs
    assert_equal(@songs,   @room_1.get_songs)
  end

  def test_get_guests
    assert_equal(@guests,   @room_1.get_guests)
  end

  def test_can_add_song
    @room_1.add_song(@song_3)
    assert_equal(3, @room_1.get_songs.count)
    assert(@room_1.get_songs.include?(@song_3))
  end

  def test_can_check_guest_in
    @room_1.check_guest_in(@guest_4)
    assert_equal(4, @room_1.get_guests.count)
    assert(@room_1.get_guests.include?(@guest_4))
  end

  def test_can_check_guest_out
    @room_1.check_guest_out(@guest_3)
    assert_equal(2, @room_1.get_guests.count)
    refute(@room_1.get_guests.include?(@guest_3))
  end

end
