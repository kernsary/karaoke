class Guest

  attr_reader :name, :wallet, :fav_song

  def initialize(name, wallet, fav_song)
    @name = name
    @wallet = wallet
    @fav_song = fav_song
  end

  def guest_pays(amount)
    @wallet -= amount
  end

  def guest_cheers
    return "Ya dancer!"
  end

end
