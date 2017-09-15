module Betvictor
  module Repository

    class MarketRepository < MemoryRepository

      def initialize
        super(Betvictor::Entity::Market)
      end

    end

  end
end