require('minitest/autorun')
require('minitest/rg')
require_relative('../venue.rb')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../drink.rb')

class VenueTest < MiniTest::Test

  def setup

    @song_1 = Song.new("Movin' On Up")
    @song_2 = Song.new("Song 2")
    @song_3 = Song.new("My Way")

    @grotesque_song = Song.new("Galway Girl")

    @venue_songs_1 = [@song_1, @song_2]

    @guest_1 = Guest.new("Frank", 100, "My Way")
    @guest_2 = Guest.new("Jodie", 80, "My Way")
    @guest_3 = Guest.new("Paul", 80, "I Will Survive")
    @guest_4 = Guest.new("Julianne", 120, "I Will Survive")
    @guest_5 = Guest.new("Suzanne", 60, "Galway Girl")

    @guests = [@guest_1, @guest_2, @guest_3]

    @drink_1 = Drink.new("Lager", 5)
    @drink_2 = Drink.new("Gin", 4)

    @drinks = [@drink_1, @drink_2]

    @room_1 = Room.new("Sinatra", 4, @drinks, 500)
    @room_2 = Room.new("Nina", 6, @drinks, 700)

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

  def test_can_remove_song_from_room
    @venue.add_song_to_room(@room_1, @song_1)
    @venue.remove_song_from_room(@room_1, @song_1)
    assert_equal(0, @room_1.get_songs.count)
  end

  def test_can_check_guest_into_room__room_has_space_and_guest_has_money
    @venue.check_guest_into_room(@guest_1, @room_1)
    assert_equal(1, @room_1.get_guests.count)
    assert_equal(1010, @venue.venue_till)
    assert_equal(90, @guest_1.wallet)
  end

  def test_can_check_guest_into_room__guest_has_no_money
    poor_guest = Guest.new("Joe", 5, "I Will Survive")
    assert_equal("Sorry, you don't have enough money.", @venue.check_guest_into_room(poor_guest, @room_1))
  end

  def test_can_check_guest_into_room__room_is_full
    @venue.check_guest_into_room(@guest_1, @room_1)
    @venue.check_guest_into_room(@guest_2, @room_1)
    @venue.check_guest_into_room(@guest_3, @room_1)
    @venue.check_guest_into_room(@guest_4, @room_1)
    assert_equal("Sorry, Sinatra is full.", @venue.check_guest_into_room(@guest_5, @room_1))
  end

  def test_can_check_guest_out_of_room
    @venue.check_guest_into_room(@guest_1, @room_1)
    @venue.check_guest_out_of_room(@guest_1, @room_1)
    assert_equal(0, @room_1.get_guests.count)
  end

  def test_can_reset_room
    @venue.check_guest_into_room(@guest_1, @room_1)
    @venue.add_song_to_room(@room_1, @song_1)
    @venue.reset_room(@room_1)
    assert_equal([], @room_1.get_guests)
    assert_equal([], @room_1.get_songs)
  end

  def test_can_get_room_till
    assert_equal(500, @room_1.room_till)
  end

  def test_can_move_cash_from_room_till_to_venue_till
    @venue.get_room_cash(@room_1, 300)
    assert_equal(1300, @venue.venue_till)
    assert_equal(200, @room_1.room_till)
  end

  def test_can_get_room_songs
    @venue.add_song_to_room(@room_1, @song_1)
    assert_equal([@song_1], @venue.get_room_songs(@room_1))
  end

  def test_ban_song
    @venue.add_song_to_list(@grotesque_song)
    @venue.add_song_to_room(@room_1, @grotesque_song)
    @venue.add_song_to_room(@room_2, @grotesque_song)
    @venue.ban_song(@grotesque_song)
    assert_equal(2, @venue.get_songs.count)
    assert_equal([], @room_1.get_songs)
    assert_equal([], @room_2.get_songs)
  end

end
