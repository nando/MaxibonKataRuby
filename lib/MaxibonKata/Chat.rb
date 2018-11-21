module MaxibonKata
  class Chat
    attr_reader :messageSent

    def sendMessage( message )
      @messageSent = message
    end
  end
end
