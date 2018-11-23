$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "rantly/minitest_extensions"
require "MaxibonKata"
require "minitest/autorun"

Rantly.default_size = 10

def unpredicteble_developer
  MaxibonKata::Developer.new(string, integer)
end

def karumi_developer
  MaxibonKata::Developer.new sized( 8 ){ string( :upper ) },
                             range( 0, 12 )
end

def hungry_developer
  MaxibonKata::Developer.new sized( 8 ){ string( :upper ) },
                             range( 13, 42 )
end

def not_so_hungry_developer
  MaxibonKata::Developer.new sized( 8 ){ string( :upper ) },
                             range( 0, 2 )
end

def karumies_group
  array( range( 2, 5) ) { karumi_developer }
end

def developers_group
  array( range( 2, 10) ) { unpredicteble_developer }
end

def hungry_group
  array( range( 2, 10) ) { hungry_developer }
end

def developers_who_wont_grab_all_maxibons
  array( range( 2, 3) ) { not_so_hungry_developer }
end

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
