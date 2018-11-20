module MaxibonKata
  class KarumiHQs
    MIN_MAXIBONS = 2
    MAX_MAXIBONS = 10

    attr_reader :maxibonsLeft

    def initialize
      @maxibonsLeft = 10
    end

    def openFridge( developer )
      grab_maxibons developer
      if should_buy_more_maxibons?
        buy_maxibons
      end
    end

    private

    def should_buy_more_maxibons?
      @maxibonsLeft <= MIN_MAXIBONS
    end

    def grab_maxibons( developer )
      @maxibonsLeft = if developer.maxibonsToGrab > @maxibonsLeft
                        0
                      else
                        @maxibonsLeft - developer.maxibonsToGrab
                      end
    end

    def buy_maxibons
      @maxibonsLeft += MAX_MAXIBONS
    end

  end
end
