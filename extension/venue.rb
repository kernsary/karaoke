class Venue

  attr_reader :name, :entrance_charge, :venue_till

  def initialize(name, rooms, songs, entrance_charge, venue_till)

    @name = name#
    @rooms = rooms
    @venue_songs = songs
    @entrance_charge = entrance_charge
    @venue_till = venue_till
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

  def check_guest_into_room(guest, room)
    if guest.wallet < @entrance_charge
      return "Sorry, you don't have enough money."
    end
    if room.at_capacity?
      return "Sorry, #{room.name} is full."
    end
    room.check_guest_in(guest)
    @venue_till += @entrance_charge
    guest.guest_pays(@entrance_charge)
  end

end
