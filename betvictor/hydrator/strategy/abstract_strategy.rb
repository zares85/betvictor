module Betvictor
  module Hydrator

    class AbstractStrategy

      @mapping
      @object_class

      def initialize(mapping, object_class)
        @mapping = self.verify(mapping, Hash)
        @object_class = self.verify(object_class, Class)
      end

      def hydrate(hash, object)
        self.verify(hash, Hash)
        self.verify(object, @object_class)
        self.map(hash, object)
      end

      protected

      def verify(object, expected_class)
        raise ArgumentError, "Expected #{expected_class}. Received #{object.class}" unless object.is_a? expected_class
        object
      end

      def map(hash, object)
        @mapping.each do |key, value|
          object.send("#{key}=", hash[value])
        end
      end

    end

  end
end