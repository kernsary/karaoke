require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')

class GuestTest < MiniTest::Test

  def setup

    @guest_1 = Guest.new("Frank")

  end

  def test_get_name
    assert_equal("Frank", @guest_1.name)
  end

end
