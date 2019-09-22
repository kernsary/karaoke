class Guest

  attr_reader :name, :wallet, :fav_song, :cheers

  def initialize(name, wallet, fav_song)
    @name = name
    @wallet = wallet
    @fav_song = fav_song
    @cheers = false
  end

  def guest_pays(amount)
    @wallet -= amount
  end

  def guest_cheers
    @cheers = true
    return "Ya dancer!"
  end

end
