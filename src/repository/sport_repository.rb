module Betvictor
  module Repository

    class SportRepository < MemoryRepository

      def initialize
        super(Betvictor::Entity::Sport)
      end

    end

  end
end