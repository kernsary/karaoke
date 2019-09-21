class Venue

  attr_reader :name, :entrance_charge

  def initialize(name, rooms, songs, entrance_charge)

    @name = name#
    @rooms = rooms
    @venue_songs = songs
    @entrance_charge = entrance_charge
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

  def add_song_to_list(song)
    @venue_songs.push(song)
  end

  def add_song_to_room(room, song)
    room.add_song(song)
  end

end
