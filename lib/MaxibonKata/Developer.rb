module MaxibonKata
  class Developer
    attr_reader :name, :maxibonsToGrab

    def initialize(name, maxibonsToGrab = 0)
      @name = name
      @maxibonsToGrab = [0, maxibonsToGrab].max
    end
  end
end
