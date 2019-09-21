require('minitest/autorun')
require('minitest/rg')
require_relative('../venue.rb')
require_relative('../room.rb')
require_relative('../guest.rb')

class VenueTest < MiniTest::Test

  def setup

    @song_1 = "Movin' On Up"
    @song_2 = "Song 2"
    @song_3 = "My Way"

    @venue_songs_1 = [@song_1, @song_2]

    @guest_1 = Guest.new("Frank", 100)
    @guest_2 = Guest.new("Jodie", 80)
    @guest_3 = Guest.new("Paul", 40)
    @guest_4 = Guest.new("Julianne", 120)

    @guests = [@guest_1, @guest_2, @guest_3]


    @room_1 = Room.new("Sinatra", 4)
    @room_2 = Room.new("Nina", 6)

    @rooms = [@room_1, @room_2]

    @venue = Venue.new("CCC", @rooms, @venue_songs_1, 10, 1000)

  end

  def test_can_get_name
    assert_equal("CCC", @venue.name)
  end

  def test_can_get_rooms
    assert_equal(2, @venue.get_rooms.count)
  end


  def test_can_get_songs
    assert_equal(2, @venue.get_songs.count)
  end

  def test_can_get_guests
    assert_equal([], @venue.get_guests)
  end

  def test_can_get_entrance_charge
    assert_equal(10, @venue.entrance_charge)
  end

  def test_can_get_venue_till
assert_equal(1000, @venue.venue_till)
  end

  def test_can_add_song_to_list
    @venue.add_song_to_list(@song_3)
    assert_equal(3, @venue.get_songs.count)
  end

  def test_can_add_song_to_room
    @venue.add_song_to_room(@room_1, @song_1)
    assert_equal(1, @room_1.get_songs.count)
  end

  # def test_can_check_guest_into_room
  #   @venue.check_guest_in(@guest_1, @room_1)
  #   assert_equal(1, @room_1.get_guests.count)
  #   assert_equal(10)
  # end

end
