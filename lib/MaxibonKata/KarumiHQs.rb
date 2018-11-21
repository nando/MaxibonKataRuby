module MaxibonKata
  class KarumiHQs
    MIN_MAXIBONS = 2
    MAX_MAXIBONS = 10

    attr_reader :maxibonsLeft
    attr_reader :chat

    def initialize( chat = nil )
      @maxibonsLeft = 10
      @chat = chat
    end

    def openFridge( developer_or_developers )
      developers = Array( developer_or_developers )
      developers.each do | developer |
        grab_maxibons developer
      end

      if should_buy_more_maxibons?
        notify_we_should_buy_maxibon( developers.last ) if @chat
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

    def notify_we_should_buy_maxibon( developer )
      @chat.sendMessage "Hi guys, I'm #{developer.name}. We need more maxibons!"
    end

    def buy_maxibons
      @maxibonsLeft += MAX_MAXIBONS
    end

  end
end
