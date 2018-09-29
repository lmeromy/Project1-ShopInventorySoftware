require("minitest/autorun")
require("minitest/rg")
require_relative("../item")
require("pry")



# could you create an array locally within the test then feed the array name in, in the same way we do with options? never tried it.  I am testing so far using pry and psql
# Gillian"s just about got it, but you"d want to pass in a hash. Curly brackets. Not an array.
# And don"t call DB methods in your test, you"ll knacker your database.

class TestItem < Minitest::Test

  def setup()
    # should use double quotes here??
    # using 40% margin aka wholesale is 40% off of retail
    @item1 = Item.new({"id" => 1, "product" => "Climbing Harness", "category" => "climb", "costprice" => 60, "sellprice" => 100})

    @item2 = Item.new({"id" => 2, "product" => "rope", "category" => "climb", "costprice" => 84, "sellprice" => 140})

  end

  def test_item_has_productname()
    assert_equal("Climbing Harness", @item1["product"])
  end

  def test_item_costprice_is_integer()
    assert_equal(true, @item1["costprice"].integer?)
  end

end
