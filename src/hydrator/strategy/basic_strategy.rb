module Betvictor
  module Hydrator

    class BasicStrategy

      @mapping
      @object_class

      def initialize(mapping, object_class)
        @mapping = self.verify(mapping, Hash)
        @object_class = self.verify(object_class, Class)
      end

      def hydrate(data)
        self.verify(data, Hash)
        self.map(@mapping, data, @object_class.new)
      end

      protected

      def verify(object, expected_class)
        raise ArgumentError, "Expected #{expected_class}. Received #{object.class}" unless object.is_a? expected_class
        object
      end

      def map(mapping, data, object)
        mapping.each do |key, value|
          object.send("#{key}=", data[value])
        end
        object
      end

    end

  end
end