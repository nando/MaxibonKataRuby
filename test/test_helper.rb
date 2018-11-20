$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "rantly/minitest_extensions"
require "MaxibonKata"
require "minitest/autorun"

Rantly.default_size = 10

def calculate_maxibons_left(number_of_maxibons, developer)
  number_of_maxibons.tap do | number_of_maxibons |
    number_of_maxibons = [ number_of_maxibons - developer.maxibonsToGrab, 0 ].max
    if number_of_maxibons <= MaxibonKata::KarumiHQs::MIN_MAXIBONS
      number_of_maxibons += MaxibonKata::KarumiHQs::MAX_MAXIBONS
    end
  end
end
