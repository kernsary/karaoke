class Room

  attr_reader :name, :capacity

  def initialize(name, capacity)

    @name = name
    @capacity = capacity
    @room_songs = []
    @room_guests = []

  end

  def get_songs
    return @room_songs
  end

  def get_guests
    return @room_guests
  end

  def add_songs(songs)
    songs.each{|song| @room_songs.push(song)}
  end

  def check_guest_in(guest)
    @room_guests.push(guest)
  end

  def check_guest_out(guest)
    @room_guests.delete(guest)
  end

end
