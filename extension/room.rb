class Room

  attr_reader :name, :capacity

  attr_accessor :at_capacity

  def initialize(name, capacity)

    @name = name
    @capacity = capacity
    @songs = []
    @guests = []
    @at_capacity = false

  end

  def get_songs
    return @songs
  end

  def get_guests
    return @guests
  end

  def add_song(song)
    @songs.push(song)
  end

  def check_guest_in(guest)
    @guests.push(guest)
  end

  def check_guest_out(guest)
    @guests.delete(guest)
  end

end
