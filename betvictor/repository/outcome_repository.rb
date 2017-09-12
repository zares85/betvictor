module Betvictor
  module Repository

    class OutcomeRepository < MemoryRepository

      def initialize
        super(Betvictor::Entity::Outcome)
      end

    end

  end
end