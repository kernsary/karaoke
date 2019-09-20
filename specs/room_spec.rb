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

    @guests = [@guest_1, @guest_2, @guest_3, @guest_4]

    @room_1 = Room.new("Sinatra", @songs, @guests)


  end

  def test_get_room_name
    assert_equal("Sinatra", @room_1.name)
  end


end
