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

    @venue_songs = [@song_1, @song_2, @song_3]

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

  def test_get_songs
    assert_equal([], @room_1.get_songs)
  end

  def test_get_guests
    assert_equal([],   @room_1.get_guests)
  end

  def test_can_add_songs_to_room
    @room_1.add_songs(@venue_songs)
    assert_equal(3, @room_1.get_songs.count)
  end

  def test_can_check_guest_in
    @room_1.check_guest_in(@guest_1)
    assert_equal(1, @room_1.get_guests.count)
  end

  def test_can_check_guest_out
    @room_1.check_guest_in(@guest_1)
    @room_1.check_guest_out(@guest_1)
    assert_equal(0, @room_1.get_guests.count)
  end

  def test_if_room_is_at_capacity__true
    @room_1.check_guest_in(@guest_1)
    @room_1.check_guest_in(@guest_2)
    @room_1.check_guest_in(@guest_3)
    @room_1.check_guest_in(@guest_4)
    assert(@room_1.at_capacity?)
  end

  def test_if_room_is_at_capacity__false
    refute(@room_1.at_capacity?)
  end

  def test_can_reset_room
    @room_1.reset_room
    assert_equal([], @room_1.get_songs)
    assert_equal([], @room_1.get_guests)
  end



end
