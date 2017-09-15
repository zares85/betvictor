module Betvictor
  module Repository

    class AbstractRepository

      def initialize(entity_class)
        @entity_class = entity_class
      end

      # To be used by child classes to make sure the correct entity class is received
      def verify(entity)
        raise ArgumentError, "Expected #{@entity_class}. Received #{entity.class}" unless entity.is_a? @entity_class
        entity
      end

      # To be implemented by child classes
      def find(id)
        raise NotImplementedError
      end

      # To be implemented by child classes
      def save(entity)
        raise NotImplementedError
      end

    end

  end
end