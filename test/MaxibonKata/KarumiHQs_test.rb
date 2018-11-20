require "test_helper"

describe MaxibonKata::KarumiHQs do

  it "should start the day with 10 maxibons" do
    property_of {
      MaxibonKata::KarumiHQs.new
    }.check { | hq |
      hq.maxibonsLeft.must_equal 10
    }
  end

  it "should always has more than two maxibons in the fridge" do
    property_of {
      MaxibonKata::Developer.new sized(12){ string(:alpha) },
                                 integer
    }.check { | developer |
      office = MaxibonKata::KarumiHQs.new

      office.openFridge developer

      office.maxibonsLeft.must_be :>, 2
    }
  end

end
