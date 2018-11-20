module MaxibonKata
  class Developer
    attr_reader :name, :maxibonsToGrab

    def initialize(name, maxibonsToGrab = 0)
      @name = name
      @maxibonsToGrab = [0, maxibonsToGrab].max
    end

    class << self
      def pedro
        new "Pedro", 3
      end

      def fran
        new "Fran", 1
      end

      def davide
        new "Davide", 0
      end

      def sergio
        new "Sergio", 2
      end

      def jorge
        new "Jorge", 1
      end
    end
  end
end
