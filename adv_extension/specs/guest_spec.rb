require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')

class GuestTest < MiniTest::Test

  def setup

    @guest_1 = Guest.new("Frank", 100, "My Way")

  end

  def test_get_name
    assert_equal("Frank", @guest_1.name)
  end

  def test_get_wallet
    assert_equal(100, @guest_1.wallet)
  end

  def test_can_take_money_from_guest
    @guest_1.guest_pays(10)
    assert_equal(90, @guest_1.wallet)
  end

  def test_get_fav_song
    assert_equal("My Way", @guest_1.fav_song)
  end

  def test_cheers
    @guest_1.guest_cheers
    assert(@guest_1.cheers)
  end

  def test_guest_can_cheer
    assert_equal("Ya dancer!", @guest_1.guest_cheers)
  end

end
