module Betvictor
  module Repository

    class MemoryRepository < AbstractRepository

      def initialize(entity_class)
        super(entity_class)
        @data = {}
      end

      def find(id)
        @data[id]
      end

      def save(entity)
        @data[entity.id] = self.verify(entity)
      end

    end

  end
end

