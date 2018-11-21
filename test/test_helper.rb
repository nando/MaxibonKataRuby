$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "rantly/minitest_extensions"
require "MaxibonKata"
require "minitest/autorun"

Rantly.default_size = 10

def calculate_maxibons_left(maxibons, developer)
  number_of_maxibons = [ maxibons - developer.maxibonsToGrab, 0 ].max
  if number_of_maxibons <= MaxibonKata::KarumiHQs::MIN_MAXIBONS
    number_of_maxibons += MaxibonKata::KarumiHQs::MAX_MAXIBONS
  end
  number_of_maxibons
end
