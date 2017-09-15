module Betvictor
  module Repository

    class PriceRepository < MemoryRepository

      def initialize
        super(Betvictor::Entity::Price)
      end

    end

  end
end