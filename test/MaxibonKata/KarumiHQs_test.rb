require "test_helper"

describe MaxibonKata::KarumiHQs do

  it "should start the day with 10 maxibons" do
    property_of {
      MaxibonKata::KarumiHQs.new
    }.check { | office |
      office.maxibonsLeft.must_equal 10
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

  it "should buy 10 more maxibons if there are less than 3 in the fridge" do
    property_of {
      MaxibonKata::Developer.new sized( 12 ){ string( :alpha ) },
                                 range( 8, 1000 )
    }.check { | developer |
      office = MaxibonKata::KarumiHQs.new
      initial_maxibons = office.maxibonsLeft

      office.openFridge developer

      expected_maxibons = calculate_maxibons_left(initial_maxibons, developer)

      office.maxibonsLeft.must_equal expected_maxibons
    }
  end

end
