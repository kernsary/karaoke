require('minitest/autorun')
require('minitest/rg')
require_relative('../drink.rb')

class DrinkTest < MiniTest::Test

  def setup

    @drink_1 = Drink.new("Lager", 5)

  end

  def test_get_name
    assert_equal("Lager", @drink_1.name)
  end

  def test_get_price
    assert_equal(5, @drink_1.price)
  end

end
