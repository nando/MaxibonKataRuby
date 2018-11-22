$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "rantly/minitest_extensions"
require "MaxibonKata"
require "minitest/autorun"

Rantly.default_size = 10

def calculate_maxibons_left(initial_maxibons, developers)
  Array( developers ).inject( initial_maxibons ) do | acc, developer |
    maxibons_left = [ acc - developer.maxibonsToGrab, 0 ].max
    if maxibons_left <= MaxibonKata::KarumiHQs::MIN_MAXIBONS
      maxibons_left += MaxibonKata::KarumiHQs::MAX_MAXIBONS
    end
    maxibons_left
  end
end
