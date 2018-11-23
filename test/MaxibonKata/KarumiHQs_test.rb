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
      karumi_developer
    }.check { | developer |
      office = MaxibonKata::KarumiHQs.new

      office.openFridge developer

      office.maxibonsLeft.must_be :>, 2
    }
  end

  it "should buy 10 more maxibons if there are less than 3 in the fridge" do
    property_of {
      hungry_developer
    }.check { | developer |
      office = MaxibonKata::KarumiHQs.new
      initial_maxibons = office.maxibonsLeft

      office.openFridge developer

      expected_maxibons = calculate_maxibons_left( initial_maxibons,
                                                   developer )

      office.maxibonsLeft.must_equal expected_maxibons
    }
  end

  it "should request 10 more maxibons using the chat if there are less than 3 in the fridge" do
    property_of {
      hungry_developer
    }.check { | developer |
      chat = MaxibonKata::Chat.new
      office = MaxibonKata::KarumiHQs.new( chat )

      office.openFridge developer

      chat.messageSent.must_equal "Hi guys, I'm #{ developer.name }. We need more maxibons!"
    }
  end

  it "should never request more maxibons to the team using the chat if there are more than 2 in the fridge" do
    property_of {
      not_so_hungry_developer
    }.check { | developer |
      chat = MaxibonKata::Chat.new
      office = MaxibonKata::KarumiHQs.new( chat )

      office.openFridge developer

      chat.messageSent.must_be_nil
    }
  end

  it "should always has more than two maxibons in the fridge even if some karumies grab maxibons in group" do
    property_of {
      karumies_group
    }.check { | developers |
      office = MaxibonKata::KarumiHQs.new

      office.openFridge developers

      office.maxibonsLeft.must_be :>, 2
    }
  end

  it "should buy 10 more maxibons if there are less than 2 in the fridge when grabbing maxibons in group" do
    property_of {
      developers_group
    }.check { | developers |
      office = MaxibonKata::KarumiHQs.new
      initial_maxibons = office.maxibonsLeft

      office.openFridge developers

      expected_maxibons = calculate_maxibons_left( initial_maxibons,
                                                   developers )

      office.maxibonsLeft.must_equal expected_maxibons
    }
  end

  it "should request 10 more maxibons using the chat if there are less than 3 in the fridge when grabbing maxibons in group" do
    property_of {
      hungry_group
    }.check { | developers |
      chat = MaxibonKata::Chat.new
      office = MaxibonKata::KarumiHQs.new( chat )

      office.openFridge developers

      chat.messageSent.must_include "We need more maxibons!"
    }
  end

end
