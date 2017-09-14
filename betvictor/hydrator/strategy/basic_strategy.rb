module Betvictor
  module Hydrator

    class BasicStrategy

      @mapping
      @object_class

      def initialize(mapping, object_class)
        @mapping = self.verify(mapping, Hash)
        @object_class = self.verify(object_class, Class)
      end

      def hydrate(hash)
        self.verify(hash, Hash)
        self.map(@mapping, hash, @object_class.new)
      end

      protected

      def verify(object, expected_class)
        raise ArgumentError, "Expected #{expected_class}. Received #{object.class}" unless object.is_a? expected_class
        object
      end

      def map(mapping, hash, object)
        mapping.each do |key, value|
          object.send("#{key}=", hash[value])
        end
        object
      end

    end

  end
end