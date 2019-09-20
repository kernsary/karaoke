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

end
