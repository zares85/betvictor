module Betvictor
  module Hydrator

    class PolymorphismStrategy < BasicStrategy

      @polymorphism

      def initialize(mapping, polymorphism)
        super(mapping, NilClass)
        @polymorphism = self.verify(polymorphism, Hash)
      end

      def hydrate(data)
        @object_class = self.polymorphism(data, :object)
        super(data)
      end

      protected

      def polymorphism(data, info)
        type = data[@polymorphism[:field]]
        @polymorphism[:objects][type][info]
      end

      def map(mapping, data, object)
        mapping = mapping.merge(self.polymorphism(data, :mapping))
        super(mapping, data, object)
      end

    end

  end
end