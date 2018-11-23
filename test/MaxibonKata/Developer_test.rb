require "test_helper"

describe MaxibonKata::Developer do

  it "should always grab a positive number of maxibons" do
    property_of {
      unpredicteble_developer
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
    }.each do | developerName, maxibonsToGrab |
      property_of {
        [ developerName, maxibonsToGrab ]
      }.check { | developer_name, maxibons_to_grab |
        MaxibonKata::Developer.send( developer_name ).
                               maxibonsToGrab.must_equal maxibons_to_grab
      }
    end
  end
end
