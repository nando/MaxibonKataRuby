require "test_helper"

describe MaxibonKata::Developer do

  it "should assign the name of the developer in construction" do
    property_of {
      string
    }.check { |name|
      MaxibonKata::Developer.new(name).
                             name.must_equal name
    }
  end

end
