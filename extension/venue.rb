class Venue

  attr_reader :name

  def initialize(name, rooms, songs)

    @name = name#
    @rooms = rooms
    @venue_songs = songs
    @guests = []

  end

  def get_rooms
    return @rooms
  end

  def get_songs
    return @venue_songs
  end

  def get_guests
return @guests
  end

end
