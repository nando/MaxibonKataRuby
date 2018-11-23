$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "rantly/minitest_extensions"
require "MaxibonKata"
require "minitest/autorun"

Rantly.default_size = 10

def calculate_maxibons_left(initial_maxibons, developers)
  maxibons_left = Array( developers ).inject( initial_maxibons ) do | acc, developer |
    [ acc - developer.maxibonsToGrab, 0 ].max
  end
  if maxibons_left > MaxibonKata::KarumiHQs::MIN_MAXIBONS
    maxibons_left
  else
    maxibons_left + MaxibonKata::KarumiHQs::MAX_MAXIBONS
  end
end
