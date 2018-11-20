require "test_helper"

describe MaxibonKata::Developer do

  it "should always grab a positive number of maxibons" do
    property_of {
      MaxibonKata::Developer.new(string, integer)
    }.check { | developer |
      developer.maxibonsToGrab.must_be :>=, 0
    }
  end

  it "should assign the name of the developer in construction" do
    property_of {
      string
    }.check { | name |
      MaxibonKata::Developer.new( name ).
                             name.must_equal name
    }
  end

  it "should assign the number of maxibons specified to every developer" do
    {
      pedro: 3,
      fran: 1,
      davide: 0,
      sergio: 2,
      jorge: 1
    }.each do | name, maxibonsToGrab |
      property_of {
        [ name, maxibonsToGrab ]
      }.check { | name, maxibonsToGrab |
        MaxibonKata::Developer.send( name ).
                               maxibonsToGrab.must_equal maxibonsToGrab
      }
    end
  end
end
