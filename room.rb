class Room

  attr_reader :name

  def initialize(name, songs, guests)

    @name = name
    @songs = songs
    @guests = guests

  end

  def get_songs
    return @songs
  end

  def get_guests
    return @guests
  end

  def check_guest_in(guest)
    @guests.push(guest)
  end

  def check_guest_out(guest)
    @guests.delete(guest)
  end

end
