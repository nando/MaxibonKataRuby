require "test_helper"

describe MaxibonKata::KarumiHQs do

  it "should start the day with 10 maxibons" do
    property_of {
      MaxibonKata::KarumiHQs.new
    }.check { |hq|
      hq.maxibonsLeft.must_equal 10
    }
  end

end
