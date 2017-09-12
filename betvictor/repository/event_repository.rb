module Betvictor
  module Repository

    class EventRepository < MemoryRepository

      def initialize
        super(Betvictor::Entity::AbstractEvent)
      end

    end

  end
end