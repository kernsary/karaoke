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

    @songs = [@song_1, @song_2]

    @guest_1 = Guest.new("Frank")
    @guest_2 = Guest.new("Jodie")
    @guest_3 = Guest.new("Paul")
    @guest_4 = Guest.new("Julianne")

    @guests = [@guest_1, @guest_2, @guest_3]


    @room_1 = Room.new("Sinatra", 4)
    @room_2 = Room.new("Nina", 6)

    @rooms = [@room_1, @room_2]

    @venue = Venue.new("CCC", @rooms, @songs)

  end

  def test_can_get_name
    assert_equal("CCC", @venue.name)
  end


end
