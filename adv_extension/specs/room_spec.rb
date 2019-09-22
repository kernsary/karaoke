require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')
require_relative('../drink.rb')

class RoomTest < MiniTest::Test

  def setup

    @song_1 = Song.new("Movin' On Up")
    @song_2 = Song.new("Song 2")
    @song_3 = Song.new("My Way")

    @venue_songs = [@song_1, @song_2, @song_3]

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


  end

  def test_get_room_name
    assert_equal("Sinatra", @room_1.name)
  end

  def test_get_capacity
    assert_equal(4, @room_1.capacity)
  end

  def test_get_drinks
    assert_equal(@drinks, @room_1.get_drinks)
  end

  def test_get_room_till
    assert_equal(500, @room_1.room_till)
  end

  def test_get_songs
    assert_equal([], @room_1.get_songs)
  end

  def test_get_guests
    assert_equal([],   @room_1.get_guests)
  end

  def test_can_add_song_to_room
    @room_1.add_song(@song_1)
    assert_equal(1, @room_1.get_songs.count)
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

  def test_fav_songs_response
    @room_1.check_guest_in(@guest_1)
    @room_1.check_guest_in(@guest_2)
    @room_1.check_guest_in(@guest_3)
    @room_1.add_song(@song_3)
    @room_1.fav_songs_response
    assert(@guest_1.cheers)
    assert(@guest_2.cheers)
    refute(@guest_3.cheers)
  end

  def test_guest_wants_drink__enough_money
    @room_1.check_guest_in(@guest_1)
    @room_1.guest_wants_drink(@guest_1, @drink_1)
    assert_equal(95, @guest_1.wallet)
    assert_equal(505, @room_1.room_till)
  end

  def test_guest_wants_drink__not_enough_money
    poor_guest = Guest.new("Mary", 3, "I Will Survive")
    @room_1.check_guest_in(poor_guest)
    assert_equal("Sorry, you don't have enough money.", @room_1.guest_wants_drink(poor_guest, @drink_1))
    assert_equal(3, poor_guest.wallet)
    assert_equal(500, @room_1.room_till)
  end

end
